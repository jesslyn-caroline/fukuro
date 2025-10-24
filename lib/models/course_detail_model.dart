import 'dart:convert';

class CourseDetailModel {
    String id;
    String name;
    String level;
    int numberOfLessons;
    List<String> technologies;
    List<String> categories;
    String description;

    CourseDetailModel({
        required this.id,
        required this.name,
        required this.level,
        required this.numberOfLessons,
        required this.technologies,
        required this.categories,
        required this.description,
    });

    factory CourseDetailModel.fromJson(Map<String, dynamic> json) => CourseDetailModel(
        id: json["_id"],
        name: json["name"],
        level: json["level"],
        numberOfLessons: json["number_of_lessons"],
        technologies: List<String>.from(json["technologies"].map((x) => x)),
        categories: List<String>.from(json["categories"].map((x) => x)),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "level": level,
        "number_of_lessons": numberOfLessons,
        "technologies": List<dynamic>.from(technologies.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "description": description,
    };
}
