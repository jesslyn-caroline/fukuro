import 'package:flutter/material.dart';
import 'package:fukuro/utils/get_user_info.dart';

import 'package:provider/provider.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/index.dart';
import 'package:fukuro/components/snackbarcustom.dart';
import 'package:fukuro/services/login_service.dart';

class Login extends StatelessWidget {
  Login({super.key});

  LoginService _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
         appBar: AppBar(
          toolbarHeight: 90,
          leading: Padding(
            padding: const EdgeInsets.all(2),
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
                  Text( "Welcome back!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  )),
                  Text("Ready to discover more?", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20, 
                    fontWeight: FontWeight.w900, 
                    color: Theme.of(context).colorScheme.secondary
                  )),
                  SizedBox(height: 20),
                  BlockField(hintText: "Email", controller: _loginService.emailC, errorText: "", isPassword: false),
                  SizedBox(height: 16),
                  BlockField(hintText: "Password", controller: _loginService.passwordC, errorText: "", isPassword: true),
                  SizedBox(height: 28),
                  BlockButton(
                    text: "LOGIN",
                    action: () async {
                      String msg = await _loginService.login();
                      if (msg != "") {
                        ScaffoldMessenger.of(context).showSnackBar(snackBarCustom(msg, context));
                        return;
                      }

                      context.read<ProfileProvider>().initUserInfo();

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Index()));
                    },
                  )
                ],
              ),
            ),
            Image.asset("assets/images/peekaboo-owl.png", width: 150, fit: BoxFit.cover),
          ]
        ),
      ),
    );
  }
}