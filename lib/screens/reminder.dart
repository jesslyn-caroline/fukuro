import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/reminder_tile.dart';
import 'package:fukuro/l10n/app_localizations.dart';
import 'package:fukuro/providers/reminder_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ReminderProvider>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 90, 24, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              context.watch<ReminderProvider>().reminderTime != null
                ? "assets/images/alarm-clock-smile.png"
                : "assets/images/alarm-clock.png",
              width: 200
            ),
            SizedBox(height: 16),
            Text(
              context.watch<ReminderProvider>().reminderTime != null
                ? l10n.reminderReminding
                : l10n.reminderSchedule,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary
              )
            ),
            SizedBox(height: 16),
            ReminderTile(
              title: l10n.reminderDate, 
              subtitle: context.watch<ReminderProvider>().reminderTime != null
                ? DateFormat.yMMMMd().format(context.read<ReminderProvider>().reminderTime!) 
                : DateFormat.yMMMMd().format(context.read<ReminderProvider>().selectedTime!), 
              icon: Icons.calendar_month_outlined, 
              action: () async {
                if (context.read<ReminderProvider>().reminderTime != null) return;
                await context.read<ReminderProvider>().showDatePicker(context);
                setState(() {});
              }
            ),
            ReminderTile(
              title: l10n.reminderTime, 
              subtitle: context.watch<ReminderProvider>().reminderTime != null
                ? DateFormat.Hm().format(context.read<ReminderProvider>().reminderTime!)
                : DateFormat.Hm().format(context.read<ReminderProvider>().selectedTime!), 
              icon: Icons.timer_outlined, 
              action: () async {
                if (context.read<ReminderProvider>().reminderTime != null) return;
                await context.read<ReminderProvider>().showTimePicker(context);
                setState(() {});
              }
            ),
            SizedBox(height: 12),
            BlockButton(
              text: context.watch<ReminderProvider>().reminderTime != null ? l10n.reminderCancel : l10n.reminderSet,
              action: () async {
                if (context.read<ReminderProvider>().reminderTime != null) {
                  await context.read<ReminderProvider>().remove();
                } else {
                  await context.read<ReminderProvider>().set(context);
                }
              }
            )
          ],
        ),
      ),
    );
  }
}