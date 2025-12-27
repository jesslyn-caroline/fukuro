import 'package:flutter/material.dart';

import 'package:fukuro/components/cards/code_card.dart';
import 'package:fukuro/models/course_chapter_material_model.dart';

class CourseMaterial extends StatelessWidget {
  CourseMaterial({super.key, required this.chapter, required this.material});

  String chapter;
  List <CourseChapterMaterialModel> material;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 60),
        children: [
          Align(
            alignment: AlignmentGeometry.topLeft,
            child: IconButton(
              padding: EdgeInsets.only(left: 14),
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary, size: 24),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),    
          Padding(
            padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Text(chapter, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24, 
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary
            ),),
          ),
          ListView.separated(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
            separatorBuilder: (context, index) => SizedBox(height: 20,),
            shrinkWrap: true,
            itemCount: material.length,
            itemBuilder: (context, index) => (
              material[index].type == 'paragraph' ? 
                Text(material[index].content, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )) : 
                CodeCard(content: material[index].content)
            ),
          ),
        ],
      ),
    );
  }
}