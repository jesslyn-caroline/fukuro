import 'dart:convert';

import 'package:fukuro/models/quiz_model.dart';
import 'package:http/http.dart' as http;

class QuizRespository {
  String URL = "https://fukuro-api.vercel.app/daily-quiz";

  Future <List <QuizModel>> fetch() async {
    List <QuizModel> quizzes = [];

    try {
      var response = await http.get(Uri.parse(URL));
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) quizzes = [ ...result["data"].map((e) => QuizModel.fromJson(e)) ];

    } catch (err) {
      print(err);
    }

    return quizzes;
  }
}