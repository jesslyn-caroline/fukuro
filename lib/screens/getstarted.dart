import 'package:flutter/material.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/screens/login.dart';
import 'package:fukuro/screens/signup.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

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
                Text(l10n.getStartedDesc, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary
                )),   
              ],
            ),
            Column(
              children: [
                BlockButton(
                  text: l10n.getStartedBtn, 
                  action: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup())),
                ),
                SizedBox(height: 15),
                BlockButton(
                  text: l10n.getStartedHaveAccount,
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