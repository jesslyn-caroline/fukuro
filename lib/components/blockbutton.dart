import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
  BlockButton({
    super.key,
    required this.text,
    required this.action,
    required this.bgColor,
    required this.textColor,
    required this.borderColor
  });
  
  String text;
  void Function() action;
  Color bgColor, textColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          side: BorderSide(color: borderColor, width: 1.5)
        ),
        onPressed: action, 
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: textColor
          )
        )
      ),
    );
  }
}