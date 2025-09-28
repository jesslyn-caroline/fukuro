import 'package:flutter/material.dart';

class BlockField extends StatelessWidget {
  BlockField({super.key, required this.hintText, required this.controller, required this.errorText, required this.isPassword});

  TextEditingController controller;
  String? errorText;
  String hintText;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        obscuringCharacter: '•',
        decoration: InputDecoration(
          hintText: hintText,
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith( 
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
          fontSize: 16
        ),    
      ),
    );
  }
}