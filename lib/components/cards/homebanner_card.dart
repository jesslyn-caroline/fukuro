import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomebannerCard extends StatelessWidget {
  const HomebannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "${AppLocalizations.of(context)!.homeBanner}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                )
              ),
            ),
          ),
          Image.asset("assets/images/illustration.png", width: 150)
        ],
      ),
    );
  }
}