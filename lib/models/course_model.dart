class CourseModel {
    String id;
    String name;
    String level;
    int numberOfLessons;

    CourseModel({
        required this.id,
        required this.name,
        required this.level,
        required this.numberOfLessons,
    });

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["_id"],
        name: json["name"],
        level: json["level"],
        numberOfLessons: json["number_of_lessons"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "level": level,
        "number_of_lessons": numberOfLessons,
    };
}
