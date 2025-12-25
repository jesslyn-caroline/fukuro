import 'package:fukuro/admob/interstitial_ad.dart';
import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/quiz_model.dart';
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
  
  late Future<List <QuizModel>> questions;
  List <String> selectedAns = List.generate(5, (e) => "");

  int score = 0;

  void init () {
    resetAll();
    questions = _quizRespository.fetch();
    _interstitialAdService.loadAd();
  }

  void calculateScore () async {
    List <QuizModel> _questions = await questions;

    for (int i = 0; i < _questions.length; i++) {
      if (_questions[i].answer == selectedAns[i]) {
        score += 20;
      }
    }
  }

  Future <void> submit(String uid, int point, int streakQuiz) async {
    calculateScore();
    vibrate();

    Map <String, dynamic> data = {
      "point" : point,
      "streakQuiz" : streakQuiz + 1,
      "lastQuizTaken" : DateFormat('yyyy-MM-dd').format(DateTime.now()),
    };

    await _interstitialAdService.showAd();

    _analytics.logQuiz(score);
    _firestoreUser.updateByUID(data);
    _usersDb.updateByUID(data);

    resetAll();
  }

  void resetAll () {
    selectedAns = List.generate(5, (e) => "");
    score = 0;
  }
}