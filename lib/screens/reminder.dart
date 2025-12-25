import 'package:flutter/material.dart';
import 'package:fukuro/components/cards/banner_card.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          children: [
            BannerCard( text: "We will remind you at scheduled time!", semanticsLabel: "Reminder Banner", image: "assets/images/clock.png",),
            
          ],
        ),
      ),
    );
  }
}