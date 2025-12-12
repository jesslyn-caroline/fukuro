import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/respositories/user_respository.dart';
import 'package:fukuro/screens/login.dart';
import 'package:fukuro/services/usersdb.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  ProfileProvider profileProvider = ProfileProvider();

  UsersDb usersDb = UsersDb();
  UserRespository userRespository = UserRespository();
  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 90,
          leading: Padding(
            padding: EdgeInsets.all(2),
            child: IconButton(
              style: Theme.of(context).iconButtonTheme.style,
              onPressed: () => Navigator.of(context).pop(), 
              icon: Icon(Icons.arrow_back)
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: ListView(
                children: [
                  Text(
                    "Let's get to know you better!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  Text(
                    "Your journey starts here!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20, 
                      fontWeight: FontWeight.w900, 
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                  SizedBox(height: 20),
                  BlockField(hintText: "Name", controller: nameC, errorText: "", isPassword: false),
                  SizedBox(height: 16),
                  BlockField(hintText: "Email", controller: emailC, errorText: "", isPassword: false),
                  SizedBox(height: 16),
                  BlockField(hintText: "Password", controller: passwordC, errorText: "", isPassword: true),
                  SizedBox(height: 16),
                  BlockField(hintText: "Confirm Password", controller: confirmPasswordC, errorText: "", isPassword: true),
                  SizedBox(height: 28),
                  BlockButton(
                    text: "SIGN UP",
                    action: () async {
                      String msg = "";

                      if (passwordC.text != confirmPasswordC.text) msg = "Passwords do not match";
                      else msg = await firebaseAuthenticationService.signup(emailC.text, passwordC.text, nameC.text);
      
                      if (msg == "") {
                        // await userRespository.post(emailC.text,passwordC.text, nameC.text);
                        emailC.text = passwordC.text = nameC.text = confirmPasswordC.text = "";
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(msg))
                        ); 
                      }      
                    },
                  )
                ],
              ),
            ),
            Image.asset("assets/images/peekaboo-owl.png", width: 150, fit: BoxFit.cover,),
          ]
        ),
      ),
    );
  }
}