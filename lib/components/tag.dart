import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  Tag({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8)
      ),     
      child: Text("$text", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.white
      ),),
    );
  }
}