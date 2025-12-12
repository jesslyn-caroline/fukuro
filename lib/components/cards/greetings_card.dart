import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fukuro/providers/profile_provider.dart';

class GreetingsCard extends StatelessWidget {
  const GreetingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> quotes = [
      AppLocalizations.of(context)!.homeFirstQuote,
      AppLocalizations.of(context)!.homeSecondQuote,
      AppLocalizations.of(context)!.homeThirdQuote,
      AppLocalizations.of(context)!.homeFourthQuote,
    ];
    return Container(
      width: double.infinity,
      height: 250,
      color: Theme.of(context).colorScheme.primary,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 36, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.hello}, ${context.read<ProfileProvider>().user!.displayName}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  )
                ),
                StreamBuilder(
                  stream: Stream.periodic(
                    Duration(seconds: 2),
                    (count) => count % quotes.length,
                  ),
                  builder: (context, snapshot) {
                    return Text(
                      quotes[snapshot.data ?? 0],
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )
                    );
                  }
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/images/peekaboo-owl.png", width: 140)
          ),
        ],
      ),
    );
  }
}