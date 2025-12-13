class UserInfoModel {
  String uid;
  String lastQuizTaken;
  int streakQuiz;

  UserInfoModel({required this.uid, required this.lastQuizTaken, required this.streakQuiz});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    uid: json["uid"],
    lastQuizTaken: json["lastQuizTaken"],
    streakQuiz: json["streakQuiz"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "lastQuizTaken": lastQuizTaken,
    "streakQuiz": streakQuiz
  };
}