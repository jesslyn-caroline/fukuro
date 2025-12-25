import 'package:flutter/material.dart';
import 'package:fukuro/models/course_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fukuro/admob/banner_ad_service.dart';
import 'package:fukuro/components/cards/course_card.dart';
import 'package:fukuro/respositories/course_respository.dart';

class Courses extends StatefulWidget {
  Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  CourseRespository courseRepository = CourseRespository();

  BannerAdService _bannerAdService = BannerAdService();
  late Future <List<CourseModel>> courses;

  @override
  void initState() {
    // TODO: implement initState
    courses = courseRepository.fetch();
    _bannerAdService.loadAd(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( "${l10n.coursesTitle}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white, 
                  fontSize: 24, 
                  fontWeight: FontWeight.w900
                )),
                SizedBox(height: 4),
                Text("${l10n.coursesDescription}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white, 
                  fontSize: 14, 
                  fontWeight: FontWeight.w500
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: FutureBuilder(
              future: courses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(),);
                if (snapshot.hasError) return Center(child: Text("${l10n.error}"),);

                return Column(
                  children: [
                    ...snapshot.data!.map((course) {
                      return CourseCard(id: course.id, title: course.name, level: course.level, numOfLessons: course.numberOfLessons,);
                    }),
                    
                  ],
                );
              }
            ),
          ),
          (
            _bannerAdService.bannerAd != null ?
            Container(
              width: _bannerAdService.bannerAd!.size.width.toDouble(),
              height: _bannerAdService.bannerAd!.size.height.toDouble(),
              child: AdWidget( ad: _bannerAdService.bannerAd! )
            ) : Container()
          )
          
        ],
      )
    );
  }
}