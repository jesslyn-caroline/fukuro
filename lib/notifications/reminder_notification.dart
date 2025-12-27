import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fukuro/notifications/notification.dart';

class ReminderNotification {
  NotificationInit _notificationInit = NotificationInit();

  Future <void> showNotification(DateTime time) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2, 
        channelKey: _notificationInit.reminderNotifChannelKey,
        title: 'Study Time ⏰',
        body: 'It\’s time for your study session. Open the app and let\'s focus together 💪📚',
        notificationLayout: NotificationLayout.BigText
      ),
      schedule: NotificationCalendar.fromDate(date: time)
    );
  }

  void cancelNotification() async => await AwesomeNotifications().cancel(2);
}