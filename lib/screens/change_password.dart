import 'package:flutter/material.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController currentPasswordC = TextEditingController();
  TextEditingController newPasswordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.of(context).pop(), 
            icon: Icon(Icons.arrow_back, size: 24)
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
                  "Change Password",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),               
                SizedBox(height: 20),
                BlockField(hintText: "Current password", controller: currentPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 16),
                BlockField(hintText: "New password", controller: newPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 16),
                BlockField(hintText: "Confirm password", controller: confirmPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 28),
                BlockButton(
                  text: "CHANGE",
                  action: () {
                    String msg = "";
                    if (newPasswordC.text != confirmPasswordC.text) msg = "Passwords do not match";

                    if (msg != "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar( content: Text(msg), backgroundColor: Theme.of(context).snackBarTheme.backgroundColor, )
                      );
                      return;
                    }
                    
                    context.read<ProfileProvider>().updateUserInfo({ "oldPassword" : currentPasswordC.text, "password" : newPasswordC.text }, "password");
                    Navigator.of(context).pop();
                  },
                  bgColor: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                  borderColor: Theme.of(context).colorScheme.primary
                )
              ],
            ),
          ),
          Image.asset("assets/images/peekaboo-owl.png", width: 150, fit: BoxFit.cover),
        ]
      ),
    );
  }
}