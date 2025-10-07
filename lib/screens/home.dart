import 'package:flutter/material.dart';
import 'package:fukuro/providers/profile.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        "Home", 
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 20, 
          color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Center(
        child: Switch(
          value: context.read<Profile>().isDark,
          onChanged: (value) {
            context.read<Profile>().changeTheme();
          }
        )
      )
    );
  }
}