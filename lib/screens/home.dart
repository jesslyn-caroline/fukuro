import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fukuro/components/cards/greetings_card.dart';
import 'package:fukuro/components/cards/homebanner_card.dart';
import 'package:fukuro/components/cards/todoDailyQuiz_card.dart';

import 'package:provider/provider.dart';

import 'package:fukuro/components/cards/course_card.dart';
import 'package:fukuro/components/cards/progress_card.dart';
import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/daily_quiz.dart';


class Home extends StatelessWidget {
  Home({super.key});

  FirebaseAnalyticsServices analytics = FirebaseAnalyticsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GreetingsCard(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    ProgressCard(title: "${AppLocalizations.of(context)!.homeOngoing}", num: 3, img: "assets/images/bulb.png"),
                    SizedBox(width: 12),
                    ProgressCard(title: "${AppLocalizations.of(context)!.homeCompleted}", num: 1, img: "assets/images/goal.png"),
                  ],
                ),
                SizedBox(height: 12),
                TodoDailyQuizCard(),           
                SizedBox(height: 20),
                HomebannerCard(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.coursesTitle}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                        )
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "${AppLocalizations.of(context)!.homeSeeAllCourse}",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary
                          )
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Column(
                  children: [
                    CourseCard(id: "68f5ad59a870cf5c0c8a7f6a", title: "Python for Starters", numOfLessons: 12, level: "Beginner"),
                    CourseCard(id: "68f5ae0b89b6d338708a6627", title: "Web Basics with HTML and CSS", numOfLessons: 25, level: "Beginner"),
                    CourseCard(id: "68f5ae6d89b6d338708a662a", title: "Get to Know JavaScript", numOfLessons: 20, level: "Beginner"),
                  ],
                )
              ],
            )
          )
        ],
      )
    );
  }
}