import 'package:flutter/material.dart';
import 'package:fukuro/components/blockbutton.dart';
import 'package:fukuro/components/blockfield.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.of(context).pop(), 
            icon: Icon(Icons.arrow_back, size: 32, color: Colors.grey,)
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
            child: ListView(
              children: [
                Text("Let’s get to know you better!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20, 
                  fontWeight: FontWeight.w900, 
                  color: Theme.of(context).colorScheme.primary),
                ),
                Text("Your journey starts here!", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20, 
                  fontWeight: FontWeight.w900, 
                  color: Theme.of(context).colorScheme.secondary),
                ),
                SizedBox(height: 20,),
                BlockField(hintText: "Name", controller: nameC, errorText: "", isPassword: false),
                SizedBox(height: 16,),
                BlockField(hintText: "Email", controller: emailC, errorText: "", isPassword: false),
                SizedBox(height: 16,),
                BlockField(hintText: "Password", controller: passwordC, errorText: "", isPassword: false),
                SizedBox(height: 16,),
                BlockField(hintText: "Confirm Password", controller: confirmPasswordC, errorText: "", isPassword: true),
                SizedBox(height: 28,),
                BlockButton(text: "SIGN UP", action: () {}, bgColor: Theme.of(context).colorScheme.primary, textColor: Colors.white, borderColor: Theme.of(context).colorScheme.primary,)
              ],
            ),
          ),
          Image.asset("assets/images/peekaboo-owl.png", width: 150, fit: BoxFit.cover,),
        ]
      ),
    );
  }
}