import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  ReminderTile({super.key, required this.title, required this.subtitle, required this.icon, required this.action});

  String title, subtitle;
  IconData icon;
  void Function() action;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
      trailing: Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary,),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).colorScheme.primary
      )),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ))
    );
  }
}