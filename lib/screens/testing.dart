import 'package:flutter/material.dart';
import 'package:fukuro/admob/interstitial_ad.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  InterstitialAdService _interstitialAdService = InterstitialAdService();

  @override
  void initState() {
    // TODO: implement initState
    _interstitialAdService.loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () => _interstitialAdService.showAd(), child: Text("Try me")),
      ),
    );
  }
}