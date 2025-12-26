import 'package:flutter/material.dart';
import 'package:fukuro/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:fukuro/notifications/reminder_notification.dart';

class ReminderService {
  ReminderNotification _reminderNotification = ReminderNotification();
  
  DateTime selectedTime = DateTime.now().add(Duration(minutes: 5));
  bool isSet = false;

  void initSelectedTime (context) {
    DateTime? savedTime = context.read<ProfileProvider>().reminderTime;

    if (savedTime == null) selectedTime = DateTime.now().add(Duration(minutes: 5));
    else if (savedTime.isAfter(DateTime.now())) {
      context.read<ProfileProvider>().setReminderTime(null);
      selectedTime = DateTime.now().add(Duration(minutes: 5));
    }
    else selectedTime = savedTime;
  }

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

  void set() => _reminderNotification.showNotification(selectedTime);
  
  void remove() => _reminderNotification.cancelNotification();
}