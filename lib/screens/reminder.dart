import 'package:flutter/material.dart';
import 'package:fukuro/components/button.dart';
import 'package:fukuro/components/cards/banner_card.dart';
import 'package:fukuro/services/reminder_service.dart';
import 'package:intl/intl.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  ReminderService _reminderService = ReminderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BannerCard( text: "We will remind you at scheduled time!", semanticsLabel: "Reminder Banner", image: "assets/images/clock.png",),
            SizedBox(height: 16,),
            Center(
              child: Column(
                children: [
                  Image.asset("assets/images/${_reminderService.selectedTime == null ? "own-on-moon" : "owl" }.png"),
                  Text( _reminderService.selectedTime == null ? 
                    "No study sessions scheduled yet." :
                    "You have a study session scheduled at ${DateFormat.yMMMMd().format(_reminderService.selectedTime!)} ${DateFormat.Hm().format(_reminderService.selectedTime!)}.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary
                    ),
                    textAlign: TextAlign.center
                  ),
                  Button(
                    action: () async {
                      await _reminderService.showDatePicker(context);
                      await _reminderService.showTimePicker(context);
                      await _reminderService.schedule();
                      setState(() {});
                    }, 
                    text: "Schedule now!",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}