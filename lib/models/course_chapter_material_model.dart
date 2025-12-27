class CourseChapterMaterialModel {
    String type; // paragraph or code
    String content;

    CourseChapterMaterialModel({
        required this.type,
        required this.content,
    });

    factory CourseChapterMaterialModel.fromJson(Map<String, dynamic> json) => CourseChapterMaterialModel(
        type: json["type"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "content": content,
    };
}
