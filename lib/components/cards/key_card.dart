import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fukuro/providers/profile_provider.dart';

class KeyCard extends StatelessWidget {
  const KeyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        spacing: 5,
        children: [
          Text(
            context.watch<ProfileProvider>().userInfo!.key.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white, 
              fontSize: 16,
              fontWeight: FontWeight.w900
            )
          ),
          Image.asset("assets/images/key.png", width: 18)
        ],
      )
    );
  }
}