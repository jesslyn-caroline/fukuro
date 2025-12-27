import 'package:flutter/material.dart';
import 'package:fukuro/models/course_chapter_material_model.dart';
import 'package:fukuro/screens/course_material.dart';

class ChapterTile extends StatelessWidget {
  ChapterTile({super.key, required this.chapter, required this.material});

  String chapter;
  List <CourseChapterMaterialModel> material;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Theme.of(context).colorScheme.tertiary,
      title: Text(chapter, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 16, 
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w900
      )),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseMaterial(
        chapter: chapter, 
        material: material,
      ))),
    );
  }
}