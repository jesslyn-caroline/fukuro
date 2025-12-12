import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/firebase/firebase_analytics.dart';
import 'package:fukuro/models/quiz_model.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/respositories/quiz_respository.dart';
import 'package:fukuro/services/usersdb.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailyQuiz extends StatefulWidget {
  const DailyQuiz({super.key});

  @override
  State<DailyQuiz> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuiz> {
  UsersDb usersDb = UsersDb();

  late Future<List<QuizModel>> quizFuture;
  List<String?> selected_answers = [];
  int score = 0;

  QuizRespository quizRespository = QuizRespository();
  FirebaseAnalyticsServices analytics = FirebaseAnalyticsServices();

  @override
  void initState() {
    super.initState();
    quizFuture = quizRespository.fetch();
  }

  void selectAnswer(int index, String? answer) {
    setState(() {
      selected_answers[index] = answer;
    });
  }

  void calculateScore(List<QuizModel> list_quiz) {
    int current_score = 0;
    for (int i = 0; i < list_quiz.length; i++) {
      if (selected_answers[i] == list_quiz[i].answer) {
        current_score += 20;
      }
    }
    setState(() {
      score = current_score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QuizModel>>(
        future: quizFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }
          if (snapshot.hasError) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.white, size: 48),
                    SizedBox(height: 16),
                    Text(
                      "Error loading quiz",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${snapshot.error}",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.quiz_outlined, color: Colors.white, size: 48),
                    SizedBox(height: 16),
                    Text(
                      "No quiz available",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          List<QuizModel> list_quiz = snapshot.data!;
          if (selected_answers.isEmpty) {
            selected_answers = List.filled(list_quiz.length, null);
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 45,
                          bottom: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: EdgeInsets.only(left: 14, right: 125),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Daily Quiz",
                                    style: GoogleFonts.quicksand(
                                      textStyle: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Take a short break and see how many questions you can get right today",
                                    style: GoogleFonts.quicksand(
                                      textStyle: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list_quiz.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 8,
                        right: 24,
                      ),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 2,
                                  bottom: 2,
                                ),
                                child: Text(
                                  "Question ${(index + 1)}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              list_quiz[index].question,
                              style: GoogleFonts.quicksand(
                                textStyle: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 20,
                              children: [
                                ...list_quiz[index].options.map((option) {
                                  return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                        40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          value: option,
                                          groupValue: selected_answers[index],
                                          onChanged: (value) {
                                            selectAnswer(index, value);
                                          },
                                        ),
                                        Expanded(
                                          child: Text(
                                            option,
                                            style: GoogleFonts.quicksand(
                                              textStyle: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: BlockButton(
                    text: "SUBMIT",
                    action: () {
                      calculateScore(list_quiz);
                      analytics.logQuiz(score);
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              title: Text(
                                "Quiz Complete!",
                                style: GoogleFonts.quicksand(
                                  textStyle: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              content: Text(
                                "Your score: $score",
                                style: GoogleFonts.quicksand(
                                  textStyle: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "OK",
                                    style: GoogleFonts.quicksand(
                                      textStyle: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      );
                    },
                    bgColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    borderColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
