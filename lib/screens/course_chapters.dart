import 'package:flutter/material.dart';

import 'package:fukuro/components/ad_button.dart';
import 'package:fukuro/components/chapter_tile.dart';
import 'package:fukuro/respositories/course_chapter_repository.dart';
import 'package:fukuro/utils/get_user_info.dart';

class CourseChapters extends StatefulWidget {
  CourseChapters({super.key, required this.id, required this.title});

  String id, title;

  @override
  State<CourseChapters> createState() => _CourseChaptersState();
}

class _CourseChaptersState extends State<CourseChapters> {
  CourseChapterRepository _chapterRepository = CourseChapterRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: _chapterRepository.fetchById(widget.id), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
          if (snapshot.hasError || snapshot.data == null) return Text("Something wrong");
          return ListView(
            padding: EdgeInsets.symmetric(vertical: 60),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(left: 14),
                    icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary, size: 24),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(right: 20),
                    child: AdButton(count: 5)
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24, 
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary
                  )
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 12,),
                itemCount: snapshot.data!.chapters.length,
                itemBuilder:(context, index) {
                  return ChapterTile(
                    chapter: snapshot.data!.chapters[index],
                    material: index >= snapshot.data!.materials.length ? [] : snapshot.data!.materials[index],
                  );
                }
              )
            ]
          );
        }
      )
    );
  }
}