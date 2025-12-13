import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

import 'package:provider/provider.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  String? selectedLang;

  String getSelectedLang() {
    return context.read<ProfileProvider>().selectedLang;
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedLang = getSelectedLang();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    List<Map<String, String>> languages = [
      {"id": "en", "label": l10n.languageEnglish},
      {"id": "id", "label": l10n.languageIndonesian},
      {"id": "ja", "label": l10n.languageJapanese},
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 45, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    style: Theme.of(context).iconButtonTheme.style!.copyWith( iconColor: MaterialStatePropertyAll(Colors.white)),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 125),
                    child: Text(
                      l10n.languageQuestion,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                ...languages.map((lang) => Container(
                  margin: EdgeInsets.only( bottom: 14 ),
                  child: Semantics(
                    excludeSemantics: true,
                    label: "Change language to ${lang["label"]}",
                    hint: "Double Tap to select and tap save button to change",
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: selectedLang == lang['id'] ? Theme.of(context).colorScheme.primary : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      tileColor: selectedLang == lang['id'] ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.tertiary,
                      title: Text( lang["label"]!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      )),
                      onTap: () {
                        selectedLang = lang['id'];
                        setState(() {});
                      },
                    ),
                  ),
                )),
                SizedBox(height: 24),
                BlockButton(
                  text: "${l10n.changeButton}",
                  action: () {
                    context.read<ProfileProvider>().changeLang(selectedLang!);
                    Navigator.of(context).pop();
                  },
                  bgColor: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                  borderColor: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}