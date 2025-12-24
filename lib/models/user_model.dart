class UserModel {
  String uid;
  String displayName;
  String email;
  String photoURL;
  int point;
  int streakQuiz;
  String lastQuizTaken;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.point,
    required this.streakQuiz,
    required this.lastQuizTaken
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    displayName: json['displayName'],
    email: json['email'],
    photoURL: json['photoURL'],
    point: json['point'],
    streakQuiz: json['streakQuiz'],
    lastQuizTaken: json['lastQuizTaken'],
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'email': email,
    'photoURL': photoURL,
    'point': point,
    'streakQuiz': streakQuiz,
    'lastQuizTaken': lastQuizTaken
  };
}