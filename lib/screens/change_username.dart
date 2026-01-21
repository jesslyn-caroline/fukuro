import 'package:flutter/material.dart';
import 'package:fukuro/services/change_username_service.dart';
// import 'package:fukuro/utils/get_user_info.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/l10n/app_localizations.dart';

import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';
import 'package:fukuro/providers/profile_provider.dart';

class ChangeUsername extends StatelessWidget {
  ChangeUsername({super.key});

  ChangeUsernameService _changeUsernameService = ChangeUsernameService();

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: ValueKey("changeUsernameScreen"),
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
                  "${l10n.usernameChange}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),               
                SizedBox(height: 20),
                BlockField(hintText: "${l10n.usernameNew}", controller: _changeUsernameService.nameC, errorText: "", isPassword: false),
                SizedBox(height: 28),
                BlockButton(
                  text: "${l10n.changeButton}",
                  action: () async {
                    await _changeUsernameService.change();
                    context.read<ProfileProvider>().setUserInfo(null, null, null, null);
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