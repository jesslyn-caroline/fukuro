import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/reminder_tile.dart';
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
            SizedBox(height: 16),
            Text("Schedule your study session!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary
            )),
            SizedBox(height: 16),
            ReminderTile(
              title: "Date", 
              subtitle: _reminderService.selectedTime != null ? DateFormat.yMMMMd().format(_reminderService.selectedTime!) : "Not set", 
              icon: Icons.calendar_month_outlined, 
              action: () async {
                await _reminderService.showDatePicker(context);
                setState(() {});
              }
            ),
            ReminderTile(
              title: "Time", 
              subtitle: _reminderService.selectedTime != null ? DateFormat.Hm().format(_reminderService.selectedTime!) : "Not set", 
              icon: Icons.timer_outlined, 
              action: () async {
                await _reminderService.showTimePicker(context);
                setState(() {});
              }
            ),
            SizedBox(height: 12),
            BlockButton(text: "SET REMINDER", action: () {})
          ],
        ),
      ),
    );
  }
}