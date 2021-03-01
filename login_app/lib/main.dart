import 'package:flutter/material.dart';
import 'package:login_app/ui/CustomLoginForm.dart';

void main() {
  runApp(Login());
}
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login app by hardik",
      home: Scaffold(
        appBar: new AppBar(

          title: Text("LOGIN APP", ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
      backgroundColor: Colors.lightGreenAccent,
       body: Container(
                child: CustomLoginForm(
            
         ),
       ),

      )
    );
  }
}
