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
        padding: EdgeInsets.fromLTRB(24, 90, 24, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/alarm-clock.png", width: 200),
            ListTile(
              title: Text("Date", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary
              )),
              subtitle: Text("${_reminderService.selectedTime != null ? DateFormat.yMMMMd().format(_reminderService.selectedTime!) : "-"}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary
              )),
              onTap: () async {
                await _reminderService.showDatePicker(context);
                setState(() {});
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.timer_sharp),
              title: Text("Time", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary
              )),
              subtitle: Text("${_reminderService.selectedTime != null ? DateFormat.Hm().format(_reminderService.selectedTime!) : "-"}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary
              )),
              onTap: () async {
                await _reminderService.showTimePicker(context);
                setState(() {});
              },
            )
            // Text("Hi, I'm Fuko!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //   fontSize: 20,
            //   fontWeight: FontWeight.w900,
            //   color: Theme.of(context).colorScheme.primary
            // )),
            // Text("Your study reminder", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //   fontSize: 20, 
            //   fontWeight: FontWeight.w900, 
            //   color: Theme.of(context).colorScheme.secondary
            // )),
          ],
        ),
      ),
    );
  }
}