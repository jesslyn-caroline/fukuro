import 'package:flutter/material.dart';
import 'package:fukuro/components/button.dart';
import 'package:fukuro/components/tag.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: IconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(), 
          icon: Icon(Icons.arrow_back, size: 24)
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Python for Starters", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20, 
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary),
            ),
            Text("Level: Beginner", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w900,)
            ),
            Text("Number of Lessons: 12", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w900,)
            ),
            SizedBox(height: 16,),
            Wrap( 
              children: [
                Tag(text: "Python"),
              ],
            ),
            SizedBox(height: 12,),
            Divider(color: Colors.grey,),
            SizedBox(height: 12,),
            Text("A beginner-friendly course that introduces you to Python fundamentals. Start your Python journey from scratch — discover its core concepts, syntax, and logic.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 14,)
            ),
            SizedBox(height: 12,),
            Container(
              alignment: Alignment.centerRight,
              child: Button(action: () {}, text: "Enroll")
            )
          ],
        ),
      ),
    );
  }
}