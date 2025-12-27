import 'package:flutter/material.dart';

import 'package:fukuro/components/ad_button.dart';
import 'package:fukuro/components/cards/key_card.dart';
import 'package:fukuro/components/chapter_tile.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_unlocked_chapter.dart';
import 'package:fukuro/models/course_chapter_model.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/respositories/course_chapter_repository.dart';
import 'package:provider/provider.dart';

class CourseChapters extends StatefulWidget {
  CourseChapters({super.key, required this.id, required this.title});

  String id, title;

  @override
  State<CourseChapters> createState() => _CourseChaptersState();
}

class _CourseChaptersState extends State<CourseChapters> {
  CourseChapterRepository _chapterRepository = CourseChapterRepository();
  FirestoreUnlockedChapter _firestoreUnlockedChapter = FirestoreUnlockedChapter();

  late CourseChapterModel? courseChapters;
  late Map <String, List <int>> unlockedChapters;

  Future <void> fetchData () async {
    courseChapters = await _chapterRepository.fetchById(widget.id);
    unlockedChapters = await _firestoreUnlockedChapter.getByUID(context.read<ProfileProvider>().user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: fetchData(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Text("Something wrong");

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
                  Padding(padding: EdgeInsetsGeometry.only(right: 20), child: Row(
                    spacing: 5,
                    children: [ KeyCard(), AdButton(), ],
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Text(widget.title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24, 
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary
                )),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 12,),
                itemCount: courseChapters!.chapters.length,
                itemBuilder:(context, index) {
                  String status = "locked";
                  if (unlockedChapters.containsKey(widget.id)) {
                    if (unlockedChapters[widget.id]!.contains(index)) status = "unlocked";
                    else status = "locked";
                  }
                  if (index >= courseChapters!.materials.length) status = "coming-soon";

                  return ChapterTile(
                    chapterId: widget.id + "_" + index.toString(),
                    chapter: courseChapters!.chapters[index],
                    material: status == "coming-soon" ? [] : courseChapters!.materials[index],
                    status: status,
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