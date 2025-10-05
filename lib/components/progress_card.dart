import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  ProgressCard({super.key, required this.title, required this.num, required this.img});

  String title, img;
  int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.primary)
      ),
      child: Row(
        children: [
          Image.asset("${img}", width: 30,),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${num}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),),
              Text("${title}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800
              ),),
            ],
          )
        ],
      )
    );
  }
}