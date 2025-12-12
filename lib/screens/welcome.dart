import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:fukuro/screens/index.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/getstarted.dart';
import 'package:fukuro/screens/loading.dart';

class Welcome extends StatefulWidget {
  Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  loading() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  late Future <void> futureLoading;

  @override
  void initState() {
    futureLoading = loading();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureLoading,
      builder: (context, snapshot) { 
        if (snapshot.connectionState == ConnectionState.waiting) return Loading();
        if (context.read<ProfileProvider>().user != null) return Index();

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
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
            ),
          ),
        );
      }
    );
  }
}