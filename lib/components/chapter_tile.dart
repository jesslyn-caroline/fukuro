import 'package:flutter/material.dart';
import 'package:fukuro/components/snackbarcustom.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_unlocked_chapter.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/course_chapter_material_model.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/screens/course_material.dart';
import 'package:fukuro/services/usersdb.dart';
import 'package:provider/provider.dart';

class ChapterTile extends StatefulWidget {
  ChapterTile({super.key, required this.chapter, required this.material, required this.chapterId, required this.status});

  String chapter, chapterId, status;
  List <CourseChapterMaterialModel> material;

  @override
  State<ChapterTile> createState() => _ChapterTileState();
}

class _ChapterTileState extends State<ChapterTile> {
  FirestoreUnlockedChapter _firestoreUnlockedChapter = FirestoreUnlockedChapter();
  FirestoreUser _firestoreUser = FirestoreUser();
  UsersDb _usersDb = UsersDb();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Theme.of(context).colorScheme.tertiary,
      title: Text(widget.chapter, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 16, 
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w900
      )),
      subtitle: widget.status == "coming-soon" ? 
        Text("Coming soon", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white,fontWeight: FontWeight.w900))
        : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          widget.status == "coming-soon" ? Text("") : Text("${int.parse(widget.chapterId.split('_')[1]) == 0 ? 0 : 20 }", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w900,
            fontSize: 18
          ),),
          Icon(widget.status == 'unlocked' ? Icons.lock_open : Icons.lock, color: Theme.of(context).colorScheme.primary),
        ],
        
      ),
      onTap: () {
        if (widget.status == "coming-soon") return;
        if (widget.status == "locked") {
          List <String> id = widget.chapterId.split('_');

          Map <String, dynamic> data = { "key" : context.read<ProfileProvider>().userInfo!.key - (int.parse(id[1]) == 0? 0 : 20) };

          if (data["key"] < 0) {
            ScaffoldMessenger.of(context).showSnackBar(snackBarCustom("You don't have enough keys to unlock this chapter", context));
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBarCustom("Chapter unlocked! 🔑", context));

          _usersDb.updateByUID(context.read<ProfileProvider>().user!.uid, data);
          _firestoreUser.updateByUID(context.read<ProfileProvider>().user!.uid, data);

          context.read<ProfileProvider>().setUserInfo(null, null, null, data["key"]);

          _firestoreUnlockedChapter.postOne(context.read<ProfileProvider>().user!.uid, widget.chapterId);
          widget.status = "unlocked";
        }

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseMaterial(
          chapter: widget.chapter, 
          material: widget.material,
        )));
      },
    );
  }
}