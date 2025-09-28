import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/screens/login.dart';
import 'package:fukuro/screens/signup.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 72, 30, 72),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150),
                Image.asset('assets/images/owl.png', width: 150),
                Text("fukuro", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary
                ),),   
                SizedBox(height: 20),
                Text("Step into the world of knowledge", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary
                ), textAlign: TextAlign.center,),    
              ],
            ),
            Column(
              children: [
                BlockButton(
                  text: "GET STARTED", 
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup())), 
                  bgColor: Theme.of(context).colorScheme.primary, 
                  textColor: Colors.white,
                  borderColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: 15),
                BlockButton(
                  text: "I ALREADY HAVE AN ACCOUNT", 
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login())), 
                  bgColor: Theme.of(context).colorScheme.background, 
                  textColor: Theme.of(context).colorScheme.primary,
                  borderColor: Theme.of(context).colorScheme.primary
                )
              ],
            )   
          ],
        ),
      )
    );
  }
}