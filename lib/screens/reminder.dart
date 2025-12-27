import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/reminder_tile.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:fukuro/services/reminder_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
            Image.asset(context.watch<ProfileProvider>().reminderTime != null ? "assets/images/alarm-clock-smile.png" : "assets/images/alarm-clock.png", width: 200),
            SizedBox(height: 16),
            Text(context.watch<ProfileProvider>().reminderTime != null ? "We will remind you by the time!" : "Schedule your study session!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary
            )),
            SizedBox(height: 16),
            ReminderTile(
              title: "Date", 
              subtitle: context.watch<ProfileProvider>().reminderTime != null ?
                DateFormat.yMMMMd().format(context.read<ProfileProvider>().reminderTime!) : 
                DateFormat.yMMMMd().format(_reminderService.selectedTime), 
              icon: Icons.calendar_month_outlined, 
              action: () async {
                if (context.read<ProfileProvider>().reminderTime != null) return;
                await _reminderService.showDatePicker(context);
                setState(() {});
              }
            ),
            ReminderTile(
              title: "Time", 
              subtitle: context.watch<ProfileProvider>().reminderTime != null ?
                DateFormat.Hm().format(context.read<ProfileProvider>().reminderTime!) : 
                DateFormat.Hm().format(_reminderService.selectedTime), 
              icon: Icons.timer_outlined, 
              action: () async {
                if (context.read<ProfileProvider>().reminderTime != null) return;
                await _reminderService.showTimePicker(context);
                setState(() {});
              }
            ),
            SizedBox(height: 12),
            BlockButton(
              text: context.watch<ProfileProvider>().reminderTime != null ? "CANCEL" : "SET REMINDER", 
              action: () async {
                if (context.read<ProfileProvider>().reminderTime != null) {
                  await _reminderService.remove(context);
                } else {
                  await _reminderService.set(context);
                }
              }
            )
          ],
        ),
      ),
    );
  }
}