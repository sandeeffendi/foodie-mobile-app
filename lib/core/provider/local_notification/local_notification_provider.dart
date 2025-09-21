import 'package:assestment_restaurant_app/core/local_notifications/services/local_notifications_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationsService flutterLocalNotificationService;

  LocalNotificationProvider(this.flutterLocalNotificationService);

  int _notificationId = 0;

  bool _isNotificationEnabled = false;
  bool get isNotificationEnabled => _isNotificationEnabled;

  bool _isDailyReminderEnabled = false;
  bool get isDailyReminderEnabled => _isDailyReminderEnabled;

  bool _permission = false;
  bool get permission => _permission;

  static const _notifEnabledKey = 'notif_enabled';
  static const _dailyReminderKey = 'daily_reminder_enabled';

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  Future<bool> requestPermission() async {
    debugPrint('>>> requestPermission() called');
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final androidImpl = flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
        debugPrint('androidImpl: $androidImpl');

        final already = await androidImpl?.areNotificationsEnabled() ?? false;
        debugPrint('areNotificationsEnabled: $already');

        if (!already) {
          bool granted = false;
          try {
            granted =
                await androidImpl?.requestNotificationsPermission() ?? false;
          } catch (e) {
            debugPrint('requestPermission() not available: $e');
            granted = false;
          }
          _permission = granted;
          notifyListeners();
          return granted;
        }

        _permission = true;
        notifyListeners();
        return true;
      }

      return false;
    } catch (e, st) {
      debugPrint('requestPermission ERROR: $e\n$st');
      _permission = false;
      notifyListeners();
      return false;
    }
  }

  void showNotification() {
    _notificationId += 1;

    flutterLocalNotificationService.showNotification(
      id: _notificationId,
      title: 'Ini adalah title notification',
      body: 'Ini adalah body notification',
      payload: 'Ini adalah payload notification',
    );
  }

  /// Toggle utama on/off notification
  Future<void> handleToggle(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value) {
      final granted = await requestPermission();
      if (granted) {
        _isNotificationEnabled = true;
        await prefs.setBool(_notifEnabledKey, true);
        showNotification();
      } else {
        _isNotificationEnabled = false;
        await prefs.setBool(_notifEnabledKey, false);
      }
    } else {
      _isNotificationEnabled = false;
      _isDailyReminderEnabled = false;
      await prefs.setBool(_notifEnabledKey, false);
      await prefs.setBool(_dailyReminderKey, false);
      await flutterLocalNotificationService.cancelAll();
      await flutterLocalNotificationService.cancelDailyReminder();
    }

    notifyListeners();
  }

  /// Toggle untuk daily reminder
  Future<void> handleToggleDailyReminder(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value) {
      final granted = await requestPermission();
      if (granted) {
        _isNotificationEnabled = true;
        _isDailyReminderEnabled = true;

        await prefs.setBool(_notifEnabledKey, true);
        await prefs.setBool(_dailyReminderKey, true);

        await flutterLocalNotificationService.scheduleDailyReminder();
      }
    } else {
      _isDailyReminderEnabled = false;
      await prefs.setBool(_dailyReminderKey, false);
      await flutterLocalNotificationService.cancelDailyReminder();
    }

    notifyListeners();
  }

  /// Load status awal dari SharedPreferences & Service
  Future<void> loadNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final notifEnabled = prefs.getBool(_notifEnabledKey) ?? false;
    final dailyEnabled = await flutterLocalNotificationService
        .isDailyReminderEnabled();

    _isNotificationEnabled = notifEnabled;
    _isDailyReminderEnabled = notifEnabled && dailyEnabled;

    notifyListeners();
  }

  /// Cancel semua notifikasi
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationService.cancelAll();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notifEnabledKey, false);

    _isNotificationEnabled = false;
    _isDailyReminderEnabled = false;

    notifyListeners();
  }
}
