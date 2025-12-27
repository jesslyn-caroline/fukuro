class UnlockedChapterModel {
  String chapterId;
  String uid;

  UnlockedChapterModel({
    required this.chapterId,
    required this.uid
  });

  factory UnlockedChapterModel.fromJson(Map<String, dynamic> json) => UnlockedChapterModel(
    chapterId: json["chapterId"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "chapterId": chapterId,
    "uid": uid
  };
}