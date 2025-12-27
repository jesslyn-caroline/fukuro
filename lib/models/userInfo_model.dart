class UserInfoModel {
  String uid;
  String lastQuizTaken;
  int streakQuiz, point, key;

  UserInfoModel({required this.uid, required this.lastQuizTaken, required this.streakQuiz, required this.point, required this.key});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    uid: json["uid"],
    lastQuizTaken: json["lastQuizTaken"],
    streakQuiz: json["streakQuiz"],
    point: json["point"],
    key: json["key"]
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "lastQuizTaken": lastQuizTaken,
    "streakQuiz": streakQuiz,
    "point" : point,
    "key" : key
  };
}