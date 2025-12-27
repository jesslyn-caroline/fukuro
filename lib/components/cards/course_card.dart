import 'package:flutter/material.dart';
import 'package:fukuro/l10n/app_localizations.dart';

import 'package:fukuro/screens/course_detail.dart';

class CourseCard extends StatelessWidget {
  CourseCard({super.key, required this.id, required this.title, required this.numOfLessons, required this.level});
  
  String id, title, level;
  int numOfLessons;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetail(id: id))),
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
            Text("$level - $numOfLessons ${AppLocalizations.of(context)!.coursesDetailLessons}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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