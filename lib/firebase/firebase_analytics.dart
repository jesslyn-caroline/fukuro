import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsServices {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future <void> movePage(String u, String v) async {
    await analytics.logEvent(name: "${u}_to_${v}");
  }

  Future <void> logCourse(String title) async {
    await analytics.logEvent(name: "open_course_${title.replaceAll(' ', '_')}");
  }

  Future <void> logQuiz() async {
    DateTime curr = DateTime.now();
    String time = "${curr.day}_${curr.month}_${curr.year}_${curr.hour}_${curr.minute}_${curr.second}";
    await analytics.logEvent(name: "play_quiz_on_${time}");
  }
}