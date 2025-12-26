import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fukuro/notifications/notification.dart';

class QuizNotification {
  NotificationInit _notificationInit = NotificationInit();

  Future <void> showNotification() async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1, 
        channelKey: _notificationInit.quizNotifChannelKey,
        notificationLayout: NotificationLayout.BigText,
        title: "🎉 Hooray! You have completed a quiz.",
        body: "Don't forget to come back and do your quiz tomorrow to not lose your streak."
      )
    );
  }
}