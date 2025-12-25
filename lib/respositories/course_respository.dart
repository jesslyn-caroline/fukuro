import 'dart:convert';

import 'package:fukuro/models/course_detail_model.dart';
import 'package:fukuro/models/course_model.dart';
import 'package:http/http.dart' as http;

class CourseRespository {
  String URL = "https://fukuro-api.vercel.app/courses";

  Future <List<CourseModel>> fetch() async {
    try {
      var response = await http.get(Uri.parse(URL));
      var result = jsonDecode(response.body);

      List <CourseModel> courses = [ ...result["data"].map((e) => CourseModel.fromJson(e)) ];

      if (response.statusCode == 200) {
        return courses;
      }

    } catch (err) {
      print(err);
    }

    return [];
  }

  Future <CourseDetailModel?> fetchById(String id) async{
    try {
      var response = await http.get(Uri.parse("$URL/$id"));
      var result = jsonDecode(response.body);

      CourseDetailModel course = CourseDetailModel.fromJson(result["data"]);

      if (response.statusCode == 200) return course;

    } catch (err) {
      print(err);
    }

    return null;
  }
}