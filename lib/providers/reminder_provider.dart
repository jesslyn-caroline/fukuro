import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:fukuro/notifications/reminder_notification.dart';
import 'package:fukuro/services/sharedpref.dart';

class ReminderProvider with ChangeNotifier {
  ReminderNotification _reminderNotification = ReminderNotification();

  DateTime? reminderTime = sharedPref.getReminderTime() != null? DateTime.parse(sharedPref.getReminderTime()!) : null;
  DateTime? selectedTime = DateTime.now().add(Duration(minutes: 5));
  Timer? timerValue;


  Future <void> showDatePicker(context) async {
    await picker.DatePicker.showDatePicker(context, 
      minTime: DateTime.now(),
      currentTime: DateTime.now(),
      onConfirm: (time) => selectedTime = time,
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
        containerHeight: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }

  Future <void> showTimePicker(context) async {
    await picker.DatePicker.showTimePicker(context, 
      showSecondsColumn: false,
      currentTime: DateTime.now(),
      onChanged: (time) => selectedTime = time,
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
        containerHeight: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }

  Future<void> set(BuildContext context) async {
    reminderTime = DateTime(
      selectedTime!.year,
      selectedTime!.month,
      selectedTime!.day,
      selectedTime!.hour,
      selectedTime!.minute,
      0
    );

    sharedPref.setReminderTime(reminderTime!);

    notifyListeners();
    await _reminderNotification.showNotification(selectedTime!);

    timerValue = Timer.periodic(Duration(seconds: 1), (timer) {
      if (reminderTime!.isBefore(DateTime.now())) {
        timerValue!.cancel();
        sharedPref.delReminderTime();
        reminderTime = null;
        selectedTime = DateTime.now().add(Duration(minutes: 5));
        notifyListeners(); 
      } 
    });
  }
  
  Future<void> remove() async {
    await sharedPref.delReminderTime();
    await _reminderNotification.cancelNotification();
    timerValue!.cancel();
    reminderTime = null;
    notifyListeners();
  }

  void init() async {
    if (reminderTime == null) return;
    timerValue = Timer.periodic(Duration(seconds: 1), (timer) {
      if (reminderTime!.isBefore(DateTime.now())) {
        timerValue!.cancel();
        sharedPref.delReminderTime();
        reminderTime = null;
        selectedTime = DateTime.now().add(Duration(minutes: 5));
        notifyListeners(); 
      } 
    });
  }
}