import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fukuro/notifications/notification.dart';

class ReminderNotification {
  NotificationInit _notificationInit = NotificationInit();

  Future <void> showNotification(DateTime time) async {
    time = DateTime(time.year, time.month, time.day, time.hour, time.minute, 0);
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        notificationLayout: NotificationLayout.BigText,
        channelKey: _notificationInit.reminderNotifChannelKey,
        title: "Study Time ⏰",
        body: "It's time for your study session. Open the app and let's focus together 💪📚",
      ),
      schedule: NotificationCalendar.fromDate(date: time)
    );
  }

  void cancelNotification() async => await AwesomeNotifications().cancel(2);
}