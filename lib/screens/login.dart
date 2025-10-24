import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/index.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  // UsersDb usersDb = UsersDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Welcome back!",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                Text(
                  "Ready to discover more?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20, 
                    fontWeight: FontWeight.w900, 
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
                SizedBox(height: 20),
                BlockField(hintText: "Email", controller: emailC, errorText: "", isPassword: false),
                SizedBox(height: 16),
                BlockField(hintText: "Password", controller: passwordC, errorText: "", isPassword: true),
                SizedBox(height: 28),
                BlockButton(
                  text: "LOGIN",
                  action: () async {
                    String msg = await context.read<ProfileProvider>().login(emailC.text, passwordC.text);

                    ScaffoldMessenger.of(context).clearSnackBars();
                    if (!msg.contains("success")) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar( content: Text(msg), backgroundColor: Theme.of(context).snackBarTheme.backgroundColor, )
                      );
                      return;
                    }
                    
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Index()));
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