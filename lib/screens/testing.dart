import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/notifications/quiz_notification.dart';

class Testing extends StatelessWidget {
  Testing({super.key});

  QuizNotification _quizNotification = QuizNotification();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // CalendarDatePicker2(
            //   config: CalendarDatePicker2Config(
            //     currentDate: DateTime.now(),
            //   ),
            //   value: [],
            // ),
            BlockButton(text: "pick", action: () {
              picker.DatePicker.showDatePicker(context, 
                currentTime: DateTime.now(),
                theme: picker.DatePickerTheme(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  doneStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w900
                  ),
                  cancelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  itemStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),
                  containerHeight: MediaQuery.of(context).size.height * 0.5,

                )
              );

            })
          ],
        ),
      ),
    );
  }
}