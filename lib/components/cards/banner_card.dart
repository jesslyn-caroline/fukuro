import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  BannerCard({super.key, required this.text, required this.semanticsLabel, required this.image});

  String text, semanticsLabel, image;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 12, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "${text}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  )
                ),
              ),
            ),
            Image.asset(image, width: 150)
          ],
        ),
      ),
    );
  }
}