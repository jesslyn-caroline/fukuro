import 'package:flutter/material.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';
import 'package:fukuro/components/snackbarcustom.dart';
import 'package:fukuro/services/signup_service.dart';
import 'package:fukuro/screens/login.dart';


class Signup extends StatelessWidget {
  Signup({super.key});

  SignupService _signupService = SignupService();

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
                  Text("Let's get to know you better!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  )),
                  Text("Your journey starts here!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20, 
                    fontWeight: FontWeight.w900, 
                    color: Theme.of(context).colorScheme.secondary
                  )),
                  SizedBox(height: 20),
                  BlockField(hintText: "Name", controller: _signupService.nameC, errorText: "", isPassword: false, key: ValueKey("signupNameField"),),
                  SizedBox(height: 16),
                  BlockField(hintText: "Email", controller: _signupService.emailC, errorText: "", isPassword: false, key: ValueKey("signupEmailField"),),
                  SizedBox(height: 16),
                  BlockField(hintText: "Password", controller: _signupService.passwordC, errorText: "", isPassword: true, key: ValueKey("signupPasswordField"),),
                  SizedBox(height: 16),
                  BlockField(hintText: "Confirm Password", controller: _signupService.confirmPasswordC, errorText: "", isPassword: true, key: ValueKey("signupConfirmPasswordField"),),
                  SizedBox(height: 28),
                  BlockButton(
                    key: ValueKey("signupBtn"),
                    text: "SIGN UP",
                    action: () async {
                      String msg = await _signupService.signup();

                      if (msg != "") {
                        ScaffoldMessenger.of(context).showSnackBar(snackBarCustom(msg, context));
                        return;
                      }

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));    
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