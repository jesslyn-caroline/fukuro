import 'package:flutter/material.dart';
import 'package:fukuro/components/course_card.dart';
import 'package:fukuro/components/progress_card.dart';
import 'package:fukuro/providers/profile.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.only(left: 30, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, ${context.watch<Profile>().username}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24, 
                  fontWeight: FontWeight.w900, 
                  color: Colors.white),),
                Text("Knowledge is Power", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/images/peekaboo-owl.png", width: 140,)
                ),       
              ],
            )
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProgressCard(title: "Ongoing Course", num: 3, img: "assets/images/bulb.png",),
                    ProgressCard(title: "Completed Course", num: 3, img: "assets/images/goal.png",),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("What would you like to learn today?", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),),
                      ),
                      Image.asset("assets/images/illustration.png", width: 180,)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Popular Courses", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                    ),),
                    GestureDetector(
                      onTap: () {},
                      child: Text("See all Courses", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary
                      ),)
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Column(
                  children: [
                    CourseCard(
                      title: "Front-End Web Development: React JS",
                      subtitle: "Intermediate: 40 lessons",
                      imgSrc: "assets/images/reactjs-fill.png",
                    ),
                    CourseCard(
                      title: "Python 101: The Basics",
                      subtitle: "Beginner: 20 lessons",
                      imgSrc: "assets/images/python.png",
                    ),
                    CourseCard(
                      title: "Build Your First Web with HTML and CSS",
                      subtitle: "Intermediate: 40 lessons",
                      imgSrc: "assets/images/web.png",
                    )
                  ],
                )
                // ListView(
                //   children: [
                //     CourseCard(
                //       title: "Front-End Web Development: React JS",
                //       subtitle: "Intermediate: 40 courses",
                //       imgSrc: "assets/images/reactjs-fill.png",
                //     ),
                //     CourseCard(
                //       title: "Front-End Web Development: React JS",
                //       subtitle: "Intermediate: 40 courses",
                //       imgSrc: "assets/images/reactjs-fill.png",
                //     ),
                //     CourseCard(
                //       title: "Front-End Web Development: React JS",
                //       subtitle: "Intermediate: 40 courses",
                //       imgSrc: "assets/images/reactjs-fill.png",
                //     )
                //   ],
                // ),
              ],
            )
          )
        ],
      )
    );
  }
}