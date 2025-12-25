import 'package:flutter/material.dart';

void showAlertDialog (context, String title, String content, int score, List <Widget> actionButton) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      content: Text("$content: $score", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: actionButton,
    )
  );
}