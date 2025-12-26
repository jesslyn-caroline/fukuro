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
        title: "🎉 Daily Quiz Completed!",
        body: "You have completed today's quiz. Come back tomorrow to keep your streak 🔥"
      )
    );
  }
}