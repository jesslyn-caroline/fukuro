import 'package:flutter/material.dart';
import 'package:fukuro/components/course_card_1.dart';
import 'package:fukuro/respositories/course_respository.dart';

class Courses extends StatelessWidget {
  Courses({super.key});

  CourseRespository courseRepository = CourseRespository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(24, 40, 24, 32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Courses",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white, 
                    fontSize: 24, 
                    fontWeight: FontWeight.w900
                  )
                ),
                SizedBox(height: 4),
                Text(
                  "Explore a variety of tech courses designed to help you grow your skills",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white, 
                    fontSize: 14, 
                    fontWeight: FontWeight.w500
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: FutureBuilder(
              future: courseRepository.fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"),);
                }

                return Column(
                  children: [
                    ...snapshot.data!.map((course) {
                      return CourseCard1(id: course.id, title: course.name, level: course.level, numOfLessons: course.numberOfLessons,);
                    })
                  ],
                );
              }
            ),
          )
        ],
      )
    );
  }
}