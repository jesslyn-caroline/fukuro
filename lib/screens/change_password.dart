import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController currentPasswordC = TextEditingController();
  TextEditingController newPasswordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: IconButton(
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
                  "${l10n.passwordChange}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),               
                SizedBox(height: 20),
                BlockField(hintText: "${l10n.passwordCurrent}", controller: currentPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 16),
                BlockField(hintText: "${l10n.passwordNew}", controller: newPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 16),
                BlockField(hintText: "${l10n.passwordConfirm}", controller: confirmPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 28),
                BlockButton(
                  text: "${l10n.changeButton}",
                  action: () {
                    String msg = "";
                    if (newPasswordC.text != confirmPasswordC.text) msg = "${l10n.passwordNotMatch}";

                    if (msg != "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar( content: Text(msg), backgroundColor: Theme.of(context).snackBarTheme.backgroundColor, )
                      );
                      return;
                    }
                    
                    context.read<ProfileProvider>().updateUserProfile({ "oldPassword" : currentPasswordC.text, "password" : newPasswordC.text }, "password");
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