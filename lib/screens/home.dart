import 'package:flutter/material.dart';
import 'package:fukuro/admob/rewarded_ad_service.dart';
import 'package:fukuro/components/cards/action_card.dart';
import 'package:fukuro/components/snackbarcustom.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/services/home_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:fukuro/components/cards/greetings_card.dart';
import 'package:fukuro/components/cards/banner_card.dart';
import 'package:fukuro/components/cards/todoDailyQuiz_card.dart';
import 'package:fukuro/components/cards/course_card.dart';
import 'package:fukuro/components/cards/progress_card.dart';
import 'package:fukuro/providers/profile_provider.dart';


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RewardedAdService _rewardedAdService = RewardedAdService();
  
  HomeService _homeService = HomeService();

  @override
  void initState() {
    // TODO: implement initState
    _rewardedAdService.loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

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
                    ProgressCard(
                      title: "${l10n.homeQuizPoint}", 
                      num: context.watch<ProfileProvider>().userInfo?.point ?? 0, 
                      img: "assets/images/bulb.png",
                      semanticLabel: "You currently have ${context.watch<ProfileProvider>().userInfo?.point} points"
                    ),
                    SizedBox(width: 12),
                    ProgressCard(
                      title: "${l10n.homeStreakQuiz}", 
                      num: context.watch<ProfileProvider>().userInfo?.streakQuiz ?? 0, 
                      img: "assets/images/goal.png",
                      semanticLabel: "You have done quiz for ${context.watch<ProfileProvider>().userInfo?.streakQuiz} days in a row"
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ActionCard(
                  title: "Watch Ads to collect keys!", 
                  desc: "Keys are used to unlock courses!", 
                  image: "assets/images/marketing.png", 
                  action: () async {
                    await _homeService.watchAd(
                      () => setState(() {}),
                      () => ScaffoldMessenger.of(context).showSnackBar(snackBarCustom("Failed to load Ad", context)),
                      (reward) async {
                        await _homeService.updateKey(context.read<ProfileProvider>().userInfo!.uid, context.read<ProfileProvider>().userInfo!.key + reward);
                        context.read<ProfileProvider>().setUserInfo(null, null, null, context.read<ProfileProvider>().userInfo!.key + reward);
                      }
                    );  
                  }
                ),
                SizedBox(height: 12),
                (
                  context.watch<ProfileProvider>().userInfo?.lastQuizTaken.toString() != DateFormat('yyyy-MM-dd').format(DateTime.now()) ?
                  TodoDailyQuizCard() : SizedBox()
                ),
                SizedBox(height: 20),
                BannerCard(text: l10n.homeBanner, semanticsLabel: "Home Banner", image: "assets/images/illustration.png",),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${l10n.coursesTitle}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                      )),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "${l10n.homeSeeAllCourse}",
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