import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/screens/getstarted.dart';
import 'package:fukuro/screens/loading.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  loading() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: FutureBuilder(
          future: loading(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/owl-on-moon.png", width: 200),
                    SizedBox(height: 20),
                    Text(
                      "Discover knowledge, unlock your potential, and take the first step toward your goals.",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary
                      ),
                      textAlign: TextAlign.center
                    )
                  ],
                ),
                BlockButton(
                  text: "LET'S GO", 
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetStarted())), 
                  bgColor: Theme.of(context).colorScheme.primary, 
                  textColor: Colors.white, 
                  borderColor: Theme.of(context).colorScheme.primary
                )
              ],
            );
          }
        )
      )
    );
  }
}