import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fukuro/notifications/notification.dart';

class ReminderNotification {
  NotificationInit _notificationInit = NotificationInit();

  Future <void> showNotification(DateTime time) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        notificationLayout: NotificationLayout.BigText,
        channelKey: _notificationInit.reminderNotifChannelKey,
        title: "Study Time ⏰",
        body: "It's time for your study session. Open the app and let's focus together 💪📚",
      ),
      schedule: NotificationCalendar(
        year: time.year,
        month: time.month,
        day: time.day,
        hour: time.hour,
        minute: time.minute,
        second: 0,
        millisecond: 0,
        preciseAlarm: true
      ),
    );
  }

  Future<void> cancelNotification() async => await AwesomeNotifications().cancel(2);
}