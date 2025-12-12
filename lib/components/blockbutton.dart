import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
  BlockButton({
    super.key,
    required this.text,
    required this.action,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.isDisabled = false,
  });
  
  String text;
  void Function() action;
  Color? bgColor, textColor, borderColor;
  bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor == null? Theme.of(context).colorScheme.primary : bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5)
        ),
        onPressed: isDisabled? null : action, 
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: textColor == null? Colors.white : textColor
          )
        )
      ),
    );
  }
}