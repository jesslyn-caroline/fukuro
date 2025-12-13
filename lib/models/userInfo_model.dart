class UserInfoModel {
  String uid;
  String lastQuizTaken;
  int streakQuiz, point;

  UserInfoModel({required this.uid, required this.lastQuizTaken, required this.streakQuiz, required this.point});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    uid: json["uid"],
    lastQuizTaken: json["lastQuizTaken"],
    streakQuiz: json["streakQuiz"],
    point: json["point"]
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "lastQuizTaken": lastQuizTaken,
    "streakQuiz": streakQuiz,
    "point" : point,
  };
}