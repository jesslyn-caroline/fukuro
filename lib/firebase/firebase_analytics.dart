import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsServices {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future <void> movePage(String u, String v) async {
    await analytics.logEvent(name: "${u}_to_${v}");
  }

  Future <void> logCourse(String id, String courseName, String level) async {
    await analytics.logEvent(
      name: 'enroll_button_clicked',
      parameters: {
        'course_id': id,
        'course_name': courseName,
        'level': level,
        'time': DateTime.now().toIso8601String(),
      },

    );
  }

  Future <void> toQuiz() async {
    await analytics.logEvent(name: "to_quiz");
  }

  Future <void> logQuiz(int score) async {
    await analytics.logEvent(
      name: 'quiz_button_clicked',
      parameters: {'action': 'quiz button clicked', 'value': score.toString()},
    );
  }
}