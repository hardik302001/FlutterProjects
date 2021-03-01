import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: Planet(),
    title : "Weight on Planet",
  ));

}



class Planet extends StatefulWidget {

  @override
  _PlanetState createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {
  final TextEditingController _weightcontroller = new TextEditingController();
    int radioValue = 0;
    String _formattedtext = "";
    double _finalResult = 0.0;
  void handleRadioValueChanged(int value){
    setState((){
      radioValue = value;
      print(radioValue);
    switch(radioValue)  {
      //venus
      case 0:
      _finalResult = calculateWeight(_weightcontroller.text , 0.91);
      _formattedtext = "Your weight on Venus is ${_finalResult.toStringAsFixed(2)}";
      break;
      ///mars
      case 1:
      _finalResult = calculateWeight(_weightcontroller.text , 0.38);
      _formattedtext = "Your weight on Mars is ${_finalResult.toStringAsFixed(2)}";
      break;
      //jupiter
      case 2:
      _finalResult = calculateWeight(_weightcontroller.text , 2.34);
      _formattedtext = "Your weight on Jupiter is ${_finalResult.toStringAsFixed(2)}";
      break;



          }
      
          });
        }
        @override
        Widget build(BuildContext context) {
          return new Scaffold(
            appBar: AppBar(backgroundColor: Colors.cyanAccent ,
                           title: new Text(" WEIGHT ON PLANET", style: new TextStyle( color: Colors.black ,fontWeight : FontWeight.bold, fontSize: 20 , ), ),
                           centerTitle: true,
            ),
            backgroundColor: Colors.yellow[50],
            body : new Container(
                  alignment: Alignment.topCenter,
                  child : ListView(
                    padding: const EdgeInsets.all(3) ,
                    children: <Widget>[
                      Center(child: new Image.asset('image/1.png' , color: Colors.black,height: 200, width: 200,  )),
      
                    new Container(
                      margin: const EdgeInsets.all(3),
                      alignment: Alignment.center ,
                      child: new Column(children:<Widget> [
                        TextField(
                          controller: _weightcontroller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Enter your weight on Earth",
                            hintText: "in pounds",
                            icon: Icon(Icons.person_outline),
                            hintStyle: TextStyle(color : Colors.black,)
      
                          ),
                        ),
      
                        new Padding(padding: new EdgeInsets.all(10),),
      
                        //Radio  buttons
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget> [
                            //actual buttons
                            new Radio<int>(value: 0 , groupValue: radioValue, onChanged: handleRadioValueChanged, activeColor: Colors.deepPurple,),
                            new Text(
                                    "VENUS",style: new TextStyle(color: Colors.black,)
                            ),
                            new Radio<int>(value: 1, groupValue: radioValue, onChanged:  handleRadioValueChanged, activeColor: Colors.deepPurple),
                            new Text(
                                    "MARS",style: new TextStyle(color: Colors.black,)
                            ),
           
                            new Radio<int>(value: 2, groupValue: radioValue, onChanged:  handleRadioValueChanged, activeColor: Colors.deepPurple),
                            new Text(
                                    "JUPITER",style: new TextStyle(color: Colors.black,)
                            ),
                          ],),
      
                           Text(
                             _weightcontroller.text.isEmpty ? "Please enter weight" : 
                                    " $_formattedtext  pounds",style: new TextStyle(color: Colors.red,)
                            ),
                      ],)
                    )
      
                    ],
                    
                  )
      
      
      
            )   
          );
        }
      
        double calculateWeight(String text, double d) {
          if(int.parse(text).toString().isNotEmpty && int.parse(text)>0){
            return int.parse(text) * d;
          }
          else{
            print("WRONG INPUT!!");
            return 0;
          }
        }
}