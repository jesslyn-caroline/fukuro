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
<<<<<<< HEAD
        title: 'Study Time ⏰',
        body: 'It\’s time for your study session. Open the app and let\'s focus together 💪📚',
        notificationLayout: NotificationLayout.BigText
=======
        title: "Study Time ⏰",
        body: "It's time for your study session. Open the app and let's focus together 💪📚",
>>>>>>> 9a823430e848a84d81ac1704a52d184e1ba45f38
      ),
      schedule: NotificationCalendar.fromDate(date: time)
    );
  }

  void cancelNotification() async => await AwesomeNotifications().cancel(2);
}