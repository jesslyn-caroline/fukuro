import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.action, required this.text});

  void Function() action;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(  
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10))  
      ),
      onPressed: action, 
      child: Text("$text", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.white))
    );
  }
}