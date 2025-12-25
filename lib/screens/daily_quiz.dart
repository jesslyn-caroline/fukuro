import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fukuro/components/alert_dialog_custom.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/services/quiz_service.dart';

class DailyQuiz extends StatefulWidget {
  const DailyQuiz({super.key});

  @override
  State<DailyQuiz> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuiz> {
  QuizService _quizService = QuizService();

  @override
  void initState() {
    // TODO: implement initState
    _quizService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: FutureBuilder(
        future: _quizService.questions,
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor),);
          if (snapshot.hasError) return Text("${l10n.error}");

          return ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(4, 16, 4, 24),
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${l10n.quizDailyQuiz}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, 
                            fontSize: 24, 
                            fontWeight: FontWeight.w900
                          )),
                          SizedBox(height: 4),
                          Text("${l10n.quizDescription}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, 
                            fontSize: 14, 
                            fontWeight: FontWeight.w500
                          )),
                        ],
                      ),
                    )    
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text("Question ${index + 1}", style: Theme.of(context).textTheme.bodyMedium!.copyWith( 
                          color: Theme.of(context).colorScheme.primary, 
                          fontSize: 14, 
                          fontWeight: FontWeight.w900
                        )),
                      ),
                      SizedBox(height: 10),
                      Text("${snapshot.data![index].question}", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w900, fontSize: 18 ),),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          ...snapshot.data![index].options.map((option) => Row(
                            children: [
                              Radio(
                                value: option, 
                                groupValue: _quizService.selectedAns[index], 
                                onChanged: (value) => setState(() => _quizService.selectedAns[index] = value!),
                              ),
                              Text("$option", style: Theme.of(context).textTheme.bodyMedium!.copyWith( fontWeight: FontWeight.w900, fontSize: 16 ),),
                            ],
                          ))
                        ],
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20), 
                child: BlockButton(
                  text: l10n.quizSubmit, 
                  action: () {
                    _quizService.submit(context.read<ProfileProvider>().user!.uid, _quizService.score, context.read<ProfileProvider>().userInfo!.streakQuiz);
                    showAlertDialog(context, l10n.quizComplete, l10n.quizScore, _quizService.score, [
                      BlockButton(text: "OK", action: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      })
                    ]);
                  }
                )
              )
            ],
          );
        },
      )
    );
  }
}