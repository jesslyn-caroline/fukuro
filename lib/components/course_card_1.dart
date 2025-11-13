import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/screens/course_detail.dart';

class CourseCard1 extends StatelessWidget {
  CourseCard1({super.key, required this.id, required this.title, required this.numOfLessons, required this.level});
  
  String id, title, level;
  int numOfLessons;

  FirebaseAnalyticsServices analytics = FirebaseAnalyticsServices(); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        analytics.logCourse(title);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetail(id: id)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$title", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w900, 
              fontSize: 14),
            ),
            Text("$level - $numOfLessons lessons", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w800, 
              fontSize: 12),
            ),
          ],
        ),
      )
    );
  }
}