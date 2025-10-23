class UserModel {
  String email;
  String name;
  String profile;

  UserModel({required this.email, required this.name, required this.profile});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    name: json["name"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "profile": profile,
  };
}