import 'package:flutter/material.dart';
import 'package:fukuro/l10n/app_localizations.dart';

import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/screens/daily_quiz.dart';

class TodoDailyQuizCard extends StatelessWidget {
  TodoDailyQuizCard({super.key});

  FirebaseAnalyticsServices analyticsServices = FirebaseAnalyticsServices();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        analyticsServices.toQuiz();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DailyQuiz()));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 16, 18, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.primary)
        ),
        child: Row(
          children: [
            Image.asset("assets/images/quiz.png", width: 50),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.quizDailyQuiz}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "${AppLocalizations.of(context)!.quizDescription}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.secondary
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}