import 'package:flutter/material.dart';
import 'package:fukuro/permissions/access_location_permission.dart';
import 'package:permission_handler/permission_handler.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async => await Permission.location.request(), 
          child: Text("a")
        ),
      ),
    );
  }
}