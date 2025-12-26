import 'package:fukuro/admob/interstitial_ad_service.dart';
import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/quiz_model.dart';
import 'package:fukuro/notifications/quiz_notification.dart';
import 'package:fukuro/permissions/vibration_permission.dart';
import 'package:fukuro/respositories/quiz_respository.dart';
import 'package:fukuro/services/usersdb.dart';
import 'package:intl/intl.dart';

class QuizService {
  QuizRespository _quizRespository = QuizRespository();
  FirestoreUser _firestoreUser = FirestoreUser();
  UsersDb _usersDb = UsersDb();
  FirebaseAnalyticsServices _analytics = FirebaseAnalyticsServices();
  InterstitialAdService _interstitialAdService = InterstitialAdService();
  QuizNotification _quizNotification = QuizNotification();
  
  late Future<List<QuizModel>> questions;
  List <String> selectedAns = List.generate(5, (e) => "");

  int score = 0;

  void init () {
    questions = _quizRespository.fetch();
    _interstitialAdService.loadAd();
  }

  Future<void> calculateScore () async {
    List <QuizModel> _questions = await questions;

    for (int i = 0; i < _questions.length; i++) {
      if (_questions[i].answer == selectedAns[i]) {
        score += 20;
      }
    }
  }

  Future<void> submit() async {
    await calculateScore();
    vibrate();
    _quizNotification.showNotification();

    await _interstitialAdService.showAd();
    _interstitialAdService.loadAd();
  }

  Future<void> saveResult(String uid, int point, int streakQuiz) async {
    Map <String, dynamic> data = {
      "point" : point + score,
      "streakQuiz" : streakQuiz + 1,
      "lastQuizTaken" : DateFormat('yyyy-MM-dd').format(DateTime.now()),
    };

    await _analytics.logQuiz(score);
    await _firestoreUser.updateByUID(uid, data);
    await _usersDb.updateByUID(uid, data);
  }

  void resetAll () {
    selectedAns = List.generate(5, (e) => "");
    score = 0;
  }
}