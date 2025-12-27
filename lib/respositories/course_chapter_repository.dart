import 'dart:convert';

import 'package:fukuro/models/course_chapter_model.dart';
import 'package:http/http.dart' as http;

class CourseChapterRepository {
  String URL = "https://fukuro-api.vercel.app/course-detail/";

  Future <CourseChapterModel?> fetchById(String id) async {
    CourseChapterModel? courseChapters;

    try {
      var response = await http.get(Uri.parse("$URL$id"));
      var result = jsonDecode(response.body);

      courseChapters = CourseChapterModel.fromJson(result["data"]);

    } catch (err) {
      print(err);
    }

    return courseChapters;
  }
}