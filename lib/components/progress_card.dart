import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  ProgressCard({super.key, required this.title, required this.num, required this.img});

  String title, img;
  int num;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).colorScheme.primary)
        ),
        child: Row(
          children: [
            Image.asset(img, width: 36),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  num.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800
                  )
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}