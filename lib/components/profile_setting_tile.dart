import 'package:flutter/material.dart';

class ProfileSettingTile extends StatelessWidget {
  ProfileSettingTile({super.key, required this.action, required this.title, required this.trailing});

  void Function() action;
  String title;
  Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: action,
      title: Text("$title", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary, 
        fontWeight: FontWeight.w800
      ),),
      trailing: trailing,
    );
  }
}