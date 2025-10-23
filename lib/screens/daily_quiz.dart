import 'package:flutter/material.dart';

class DailyQuiz extends StatelessWidget {
  const DailyQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: EdgeInsets.only(left: 0, top: 40, right: 24, bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back, color: Colors.white)
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daily Quiz",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          "Take a short break and see how many questions you can get right today.",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Question 01",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Which one is NOT a programming language?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: false,
                            groupValue: "",
                            onChanged: (value) {},
                          ),
                          Text(
                            "Python",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: false,
                            groupValue: "",
                            onChanged: (value) {},
                          ),
                          Text(
                            "JavaScript",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: true,
                            groupValue: "",
                            onChanged: (value) {},
                          ),
                          Text(
                            "HTML",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: false,
                            groupValue: "",
                            onChanged: (value) {},
                          ),
                          Text(
                            "C++",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}