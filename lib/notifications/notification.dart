import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationInit {
  final String quizNotifChannelKey = 'quiz_notif';
  final String reminderNotifChannelKey = 'reminder_notif';

  void init() {
    AwesomeNotifications().initialize( null , [
      NotificationChannel(
        channelKey: quizNotifChannelKey, 
        channelName: 'Quiz Notification', 
        channelDescription: 'To remind user to do quiz tomorrow'
      ),
      NotificationChannel(
        channelKey: reminderNotifChannelKey, 
        channelName: 'Study Reminder Notification', 
        channelDescription: 'To remind user to do study at scheduled time',
        importance: NotificationImportance.High
      ),
    ]);
  }
}