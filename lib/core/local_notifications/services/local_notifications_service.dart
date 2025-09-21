import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

class LocalNotificationsService {
  static const String dailyReminderKey = "daily_reminder_enabled";
  static const int _dailyReminderId = 100;

  /// Initialize plugin
  Future<void> init() async {
    const initializationSettingsAndroid = AndroidInitializationSettings(
      "app_icon",
    );

    const initializationSettingsDarwin = DarwinInitializationSettings(
      requestBadgePermission: false,
      requestAlertPermission: false,
      requestSoundPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        final payload = notificationResponse.payload;
        if (payload != null && payload.isNotEmpty) {
          selectNotificationStream.add(payload);
        }
      },
    );
  }

  /// Request permission (iOS & Android)
  Future<bool?> requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iOSImplementation = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      return await iOSImplementation?.requestPermissions(
        badge: true,
        sound: true,
        alert: true,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      final androidImpl = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final enabled = await androidImpl?.areNotificationsEnabled() ?? false;
      if (!enabled) {
        return await androidImpl?.requestNotificationsPermission() ?? false;
      }
      return enabled;
    } else {
      return false;
    }
  }

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();

    final dynamic timeZoneInfo = await FlutterTimezone.getLocalTimezone();

    String tzName = 'UTC'; // default fallback

    if (timeZoneInfo == null) {
      tzName = 'UTC';
    } else if (timeZoneInfo is String) {
      tzName = timeZoneInfo;
    } else {
      // try several common property names
      try {
        final dynamic maybe =
            (timeZoneInfo as dynamic).timezone ??
            (timeZoneInfo as dynamic).name ??
            (timeZoneInfo as dynamic).identifier;
        if (maybe is String && maybe.isNotEmpty) {
          tzName = maybe;
        }
      } catch (_) {}

      if (tzName == 'UTC') {
        try {
          final dynamic localized = (timeZoneInfo as dynamic).localizedName;
          if (localized != null) {
            if (localized is String && localized.isNotEmpty) {
              tzName = _mapLocalizedToTzId(localized);
            } else {
              final dynamic nestedTz =
                  localized.timezone ??
                  localized.name ??
                  localized['timezone'] ??
                  localized['name'];
              if (nestedTz is String && nestedTz.isNotEmpty) {
                tzName = nestedTz;
              }
            }
          }
        } catch (_) {
          // ignore
        }
      }
    }

    try {
      tz.setLocalLocation(tz.getLocation(tzName));
    } catch (e) {
      // fallback
      tz.setLocalLocation(tz.getLocation('UTC'));
    }
  }

  // Helper
  String _mapLocalizedToTzId(String localized) {
    const Map<String, String> map = {
      'Western Indonesia Time': 'Asia/Jakarta',
      'Central Indonesia Time': 'Asia/Makassar',
      'Eastern Indonesia Time': 'Asia/Jayapura',
      'WIB': 'Asia/Jakarta',
      'WITA': 'Asia/Makassar',
      'WIT': 'Asia/Jayapura',
      'GMT+07:00': 'Asia/Jakarta',
      'GMT+08:00': 'Asia/Makassar',
      'GMT+09:00': 'Asia/Jayapura',
      'UTC': 'UTC',
      'GMT': 'UTC',
    };
    return map[localized] ?? localized;
  }

  /// Show notification method
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    String channelId = '1',
    String channelName = 'Simple Notification',
  }) async {
    final androidPlatformChannelSpecific = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      playSound: true,
    );

    const iOSNotificationsPlatform = DarwinNotificationDetails();

    final notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecific,
      iOS: iOSNotificationsPlatform,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  /// Schedule daily reminder at 11:00 AM
  Future<void> scheduleDailyReminder({int hour = 11, int minute = 0}) async {
    // ensure tz.local is configured
    await configureLocalTimeZone();

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      _dailyReminderId,
      'Lunch Reminder',
      'Jangan lupa makan siang!',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          'Daily Reminder',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'daily_reminder',
    );

    // save pref
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(dailyReminderKey, true);
  }

  /// Cancel daily reminder method
  Future<void> cancelDailyReminder() async {
    await flutterLocalNotificationsPlugin.cancel(_dailyReminderId);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(dailyReminderKey, false);
  }

  /// Check isDailyReminderEnabled method
  Future<bool> isDailyReminderEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(dailyReminderKey) ?? false;
  }

  /// Cancel all notifications
  Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
