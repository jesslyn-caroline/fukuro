import 'package:flutter/material.dart';
import 'package:fukuro/components/button.dart';
import 'package:fukuro/components/tag.dart';
import 'package:fukuro/respositories/course_respository.dart';
import 'package:fukuro/screens/loading.dart';

class CourseDetail extends StatelessWidget {
  CourseDetail({super.key, required this.id});

  CourseRespository courseRespository = CourseRespository();
  String id;

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
        child: FutureBuilder(
          future: courseRespository.fetchOne(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return Loading();
            if (snapshot.hasError) return Text("Something wrong");

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${snapshot.data!.name}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20, 
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary),
                ),
                Text("Level: ${snapshot.data!.level}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,)
                ),
                Text("Number of Lessons: ${snapshot.data!.numberOfLessons}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,)
                ),
                SizedBox(height: 16,),
                Wrap( 
                  spacing: 8,
                  runSpacing: 8,
                  children: [ ...snapshot.data!.categories.map((category) => Tag(text: category)) ],
                ),
                SizedBox(height: 12,),
                Divider(color: Colors.grey,),
                SizedBox(height: 12,),
                Text("${snapshot.data!.description}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,)
                ),
                SizedBox(height: 12,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Button(action: () {}, text: "Enroll")
                )
              ],
            );
          }
        ),
      ),
    );
  }
}