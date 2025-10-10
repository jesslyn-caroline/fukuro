import 'package:flutter/material.dart';
import 'package:fukuro/components/course_card.dart';
import 'package:fukuro/components/progress_card.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> quotes = [
    "Knowledge is your power",
    "Study now, success later",
    "Try, Fail, Learn, Repeat",
    "Progress over perfection",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, top: 52),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, ${context.read<ProfileProvider>().currentUser?.name}",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white
                            )
                          ),
                          StreamBuilder(
                            stream: Stream.periodic(
                              Duration(seconds: 2),
                              (count) => count % quotes.length,
                            ),
                            builder: (context, snapshot) {
                              return Text(
                                quotes[snapshot.data ?? 0],
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                )
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/images/peekaboo-owl.png", width: 140)
                ),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    ProgressCard(title: "Ongoing", num: 3, img: "assets/images/bulb.png"),
                    SizedBox(width: 8),
                    ProgressCard(title: "Completed", num: 1, img: "assets/images/goal.png"),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
                          child: Text(
                            "What would you like to learn today?",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            )
                          ),
                        ),
                      ),
                      Image.asset("assets/images/illustration.png", width: 140)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Popular Courses",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w900
                        )
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "See all Courses",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary
                          )
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Column(
                  children: [
                    CourseCard(
                      title: "React JS for Front-End Web Dev",
                      subtitle: "Intermediate: 40 lessons",
                      imgSrc: "assets/images/reactjs-fill.png",
                    ),
                    CourseCard(
                      title: "Python 101: The Basics",
                      subtitle: "Beginner: 20 lessons",
                      imgSrc: "assets/images/python.png",
                    ),
                    CourseCard(
                      title: "Your First Web: HTML and CSS",
                      subtitle: "Beginner: 25 lessons",
                      imgSrc: "assets/images/web.png",
                    )
                  ],
                )
              ],
            )
          )
        ],
      )
    );
  }
}