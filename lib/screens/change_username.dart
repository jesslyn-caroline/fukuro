import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';
import 'package:fukuro/providers/profile_provider.dart';

class ChangeUsername extends StatelessWidget {
  ChangeUsername({super.key});

  TextEditingController nameC = TextEditingController();

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
                  "${AppLocalizations.of(context)!.usernameChange}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),               
                SizedBox(height: 20),
                BlockField(hintText: "${AppLocalizations.of(context)!.usernameNew}", controller: nameC, errorText: "", isPassword: false),
                SizedBox(height: 28),
                BlockButton(
                  text: "${AppLocalizations.of(context)!.changeButton}",
                  action: () {
                    context.read<ProfileProvider>().updateUserInfo({ "name": nameC.text }, "displayName");
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