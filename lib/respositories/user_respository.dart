import 'dart:convert';
import 'package:fukuro/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRespository {
  String URL = "https://fukuro-api.vercel.app/user";

  Future <Map<String, dynamic>> fetch(String email, String password) async {
    Map <String, dynamic> data = {};

    try {
      var response = await http.post(Uri.parse("$URL/login"), 
        headers: { "Content-Type": "application/json" },
        body: jsonEncode({ "email": email, "password": password }) 
      );
      var result = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(result["data"]);

      data = { "message" : result["message"] };

      if (response.statusCode == 200) data["user"] = user;
      
    } catch (err) {
      data = { "message" : err.toString() };
    }

    return data; 
  }

  Future <String> post(String email, String password, String name) async {
    String msg = "";

    try {
      var response = await http.post(Uri.parse("$URL/signup"), 
        headers: { "Content-Type": "application/json" },
        body: jsonEncode( { "email": email, "password": password, "name": name }) 
      );
      var result = jsonDecode(response.body);

      if (response.statusCode == 201) msg = result["message"];

    } catch (err) {
      msg = err.toString();
    }

    return msg;
  }

  Future <void> update(Map<String, dynamic> data) async {
    try {
      var response = await http.post(Uri.parse("$URL/update-profile"),
        headers: { "Content-Type": "application/json" },
        body: jsonEncode(data),
      );
      var result = jsonDecode(response.body);
        
      if (response.statusCode == 200) print(result["message"]);
    } catch (err) {
      print(err);
    }
  }
}