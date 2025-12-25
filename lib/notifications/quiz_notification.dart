import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fukuro/notifications/notification.dart';

class QuizNotification {
  NotificationInit _notificationInit = NotificationInit();

  Future <void> showNotification() async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1, 
        channelKey: _notificationInit.quizNotifChannelKey,
        title: 'See you tomorrow!',
        body: 'Don\'t forget to your quiz tomorrow to extend your streak.'
      )
    );
  }
}