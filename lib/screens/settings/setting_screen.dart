import 'package:assestment_restaurant_app/core/provider/local_notification/local_notification_provider.dart';
import 'package:assestment_restaurant_app/screens/settings/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      final provider = context.read<LocalNotificationProvider>();
      provider.loadNotificationStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationProvider = context.watch<LocalNotificationProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Themes settings
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(
                'Theme Settings',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Center(child: ThemeButton()),

            const SizedBox.square(dimension: 20),

            /// Turn on notifications
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Turn On Notification',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// Notifications switch button
                  Switch(
                    value: notificationProvider.isNotificationEnabled,
                    onChanged: (value) async {
                      await notificationProvider.handleToggle(value);
                    },
                  ),
                ],
              ),
            ),

            // Turn on daily reminder
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Turn On Daily Reminder',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// Notifications switch button
                  Switch(
                    value: notificationProvider.isDailyReminderEnabled,
                    onChanged: (value) async {
                      await notificationProvider.handleToggleDailyReminder(
                        value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
