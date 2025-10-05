import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  CourseCard({super.key, required this.imgSrc, required this.title, required this.subtitle});
  
  String imgSrc, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.primary)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset("${imgSrc}", width: 40, height: 40,),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${title}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),),
              Text("${subtitle}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w900
              ),),
            ],
          )
        ],
      ),
    );
  }
}