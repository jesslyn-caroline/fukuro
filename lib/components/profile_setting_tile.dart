import 'package:flutter/material.dart';

class ProfileSettingTile extends StatelessWidget {
  ProfileSettingTile({super.key, required this.action, required this.title, this.subtitle, required this.trailing});

  void Function() action;
  String title;
  String? subtitle;
  Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      tileColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: action,
      title: Text("$title", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary, 
        fontWeight: FontWeight.w800
      ),),
      subtitle: subtitle != null ? Text("$subtitle", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.primary),) : null,
      trailing: trailing,
    );
  }
}