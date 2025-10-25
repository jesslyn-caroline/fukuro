import 'package:flutter/material.dart';
import 'package:fukuro/models/quiz_model.dart';
import 'package:fukuro/respositories/quiz_respository.dart';
import 'package:fukuro/screens/loading.dart';

class DailyQuiz extends StatefulWidget {
  DailyQuiz({super.key});

  @override
  State<DailyQuiz> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuiz> {
  QuizRespository quizRespository = QuizRespository();

  List <QuizModel> quizzes = [];
  List <String> chosen = [];

  // int index = 0;

  Future <void> getQuestions() async {
    quizzes = await quizRespository.fetch();
    chosen = List.generate(quizzes.length + 1, (index) => " ");

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getQuestions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 40, 0, 32),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context), 
                        icon: Icon(Icons.arrow_back, color: Colors.white, size: 24,))
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Daily Quiz", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, 
                            fontSize: 24, 
                            fontWeight: FontWeight.w900),),
                          SizedBox(height: 4,),
                          Text("Take a short break and see how many questions you can get right today.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, 
                            fontSize: 14, 
                            fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 20, 24, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(quizzes.length, (index) => Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Question ${index + 1}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12, 
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        SizedBox(height: 6,),
                        Text("${quizzes[index].question}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16, 
                          fontWeight: FontWeight.w900,
                        )),
                        SizedBox(height: 8,),
                        Column(
                          children: [
                            ...quizzes[index].options.map((option) => Row(
                              children: [
                                Radio(
                                  value: option, 
                                  groupValue: chosen[index], 
                                  onChanged: (value) {
                                    chosen[index] = option;
                                    setState(() {});
                                  },
                                ),
                                Text("$option"),
                              ],
                            )
                          )
                        ],
                      )
                    ]
                  ),
                )
              )        
            )
          )       
        ],
      )
    );
  }
}