import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fukuro/notifications/notification.dart';
import 'package:intl/intl.dart';

class QuizNotification {
  NotificationInit _notificationInit = NotificationInit();

  Future <void> showNotification(DateTime time) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2, 
        channelKey: _notificationInit.reminderNotifChannelKey,
        title: 'Don\'t forget to study!',
        body: 'You have a study session at ${DateFormat.yMMMMd().format(time)} ${DateFormat.Hm().format(time)}'
      ),
      schedule: NotificationCalendar.fromDate(date: time)
    );
  }
}