import 'package:fukuro/models/course_chapter_material_model.dart';

class CourseChapterModel {
  String id;
  List <String> chapters;
  List <List<CourseChapterMaterialModel>> materials;

  CourseChapterModel({
    required this.id,
    required this.chapters,
    required this.materials,
  });

  factory CourseChapterModel.fromJson(Map<String, dynamic> json) => CourseChapterModel(
    id: json["id"],
    chapters: List<String>.from(json["chapters"].map((x) => x)),
    materials: List<List<CourseChapterMaterialModel>>.from(
      json["materials"].map((x) => List<CourseChapterMaterialModel>.from(x.map((x) => CourseChapterMaterialModel.fromJson(x))))
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "technologies": List<dynamic>.from(chapters.map((x) => x)),
    "categories": List<List<Map<String, dynamic>>>.from(
      materials.map((x) => List<Map<String, dynamic>>.from(x.map((x) => x.toJson())))
    ),
  };
}
