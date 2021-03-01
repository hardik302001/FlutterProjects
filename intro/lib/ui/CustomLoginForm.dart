import'package:flutter/material.dart';
class CustomLoginForm extends StatefulWidget {
  @override

  _CustomLoginFormState createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(decoration: InputDecoration(
                labelText: "ENTER YOUR NAME",
                border: OutlineInputBorder(
                      gapPadding: 5, borderRadius: BorderRadius.circular(4),
                )

            ),),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "ENTER PASSWORD",
                border: OutlineInputBorder(
                  gapPadding: 5, borderRadius: BorderRadius.circular(4),
                ),
             ),
            ),
          ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding : const EdgeInsets.all(10),
                child:  RaisedButton(
                   onPressed: () { print("submit pressed!!");},
                  child: Text("SUBMIT"),
                ),
              ),


              Padding(
                padding : const EdgeInsets.all(10),
                child:  RaisedButton(

                  onPressed: () { print("button pressed"); },
                  child: Text("Clear"),
                ),
              )
            ],
          )
        )
        ],
      )
    );
  }
}
