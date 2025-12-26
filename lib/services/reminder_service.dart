import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:fukuro/notifications/reminder_notification.dart';

class ReminderService {
  ReminderNotification _reminderNotification = ReminderNotification();
  
  DateTime? selectedTime = null;

  Future <void> schedule() async {
    if (selectedTime == null) return;
    await _reminderNotification.showNotification(selectedTime!);
  }

  Future <void> showDatePicker(context) async {
    await picker.DatePicker.showDatePicker(context, 
      minTime: DateTime.now(),
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
}