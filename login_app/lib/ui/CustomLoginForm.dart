import'package:flutter/material.dart';
class CustomLoginForm extends StatefulWidget {
  @override

  _CustomLoginFormState createState() => _CustomLoginFormState();
}

//DATA CLASS
class _LoginData{
  String name="";
  String password = "";
}


class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: new Image.asset("image/face.png",height: 200,width: 200,color: Colors.black,)),
          
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(decoration: InputDecoration(
                labelText: "ENTER YOUR NAME",
                border: OutlineInputBorder(
                      gapPadding: 5, borderRadius: BorderRadius.circular(4),
                )

            ),
            validator: (value){
              if (value.isEmpty){
                return "Please enter your name!!";
              }
              else{
                _data.name  = value;
                print("name is " + value);
              }
            },
            ),
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

             validator: (value1){
              if (value1.isEmpty){
                return "Please enter your password!!";
              }
              else{
                _data.password = value1;

                print("password is " + value1);
              }
            },
            ),
          ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding : const EdgeInsets.all(10),
                child:  RaisedButton(
                   onPressed: () { 
                     if(_formKey.currentState.validate()){
                       setState(() {
                         _data.name = _data.name;
                       });
                       Scaffold.of(context).showSnackBar(SnackBar(content: Text("sab aacha h")));  
                     }
                   },
                  child: Text("SUBMIT"),
                ),
              ),


              Padding(
                padding : const EdgeInsets.all(10),
                child:  RaisedButton(

                  onPressed: () { if(_formKey.currentState.validate()){
                    _formKey.currentState.reset();
                    setState(() {
                             _data.name = "";           
  
                    });

                  } 
                  },
                  child: Text("Clear"),
                ),
              )


            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: _data.name.isEmpty ? Text("") : Text("Hello ${ _data.name}", 
          style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blueAccent, ),)),
        ),
        ],
      ) 
    );
  }
}
