import 'package:flutter/material.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int degree = -1;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 70), (timer) => setState(() => degree++));
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Transform.rotate(
                    angle: degree % 360,
                    child: Icon(Icons.star_rounded, size: 40, color: Theme.of(context).colorScheme.secondary)
                  )
                ),
                Image.asset('assets/images/owl.png', width: 140),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Transform.rotate(
                    angle: (360 - degree) % 360,
                    child: Icon(Icons.star_rounded, size: 40, color: Theme.of(context).colorScheme.tertiary)
                  )
                ),
              ],
            ),
            Text("fukuro", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.primary
            )),   
            SizedBox(height: 20),
            Text("Preparing to open the door of knowledge", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary
            ), textAlign: TextAlign.center,),    
          ],
        ),
      )
    );
  }
}