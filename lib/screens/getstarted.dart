import 'package:flutter/material.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/screens/login.dart';
import 'package:fukuro/screens/signup.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 140),
                Image.asset('assets/images/owl.png', width: 150),
                Text("fukuro", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary
                )),   
                SizedBox(height: 20),
                Text("Step into the world of knowledge", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary
                )),   
              ],
            ),
            Column(
              children: [
                BlockButton(
                  text: "GET STARTED", 
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup())),
                ),
                SizedBox(height: 15),
                BlockButton(
                  text: "I ALREADY HAVE AN ACCOUNT",
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login())),
                  bgColor: Theme.of(context).colorScheme.background,
                  textColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}