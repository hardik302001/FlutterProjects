import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Bmi(),
    title: "BMI",
  ));
}

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  String _status="";
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;

  void _calculateBMI() {
    //BMI WEIGHT STATUS
    //18.5 under wiight
    // 18.5 se 24.9  normal
    //25.0 se 29.9  overweight
    // 30 se above is obese

    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        result = weight / (inches * inches) * 703;
        //checking the scene of bmi
        if (double.parse(result.toStringAsFixed(1))< 18.5){
            _status = "UNDERWEIGHT";
            print(_status);
        }else if (double.parse(result.toStringAsFixed(1))>= 18.5 && result <25.0){
            _status = "NORMAL";
            print(_status);
        }else if (double.parse(result.toStringAsFixed(1))>= 25.0 && result <30){
            _status = "OVERWEIGHT";
            print(_status);
        }else if (double.parse(result.toStringAsFixed(1))>= 30){
            _status = "OBESE";
            print(_status);
        }




      }
      else{
        result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BMI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(3),
          children: <Widget>[
            Center(
                child: new Image.asset(
              'image/1.png',
              height: 200,
              width: 200,
            )),
            new Container(
              color: Colors.grey[200],
              margin: const EdgeInsets.all(3),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Enter your age",
                      icon: Icon(Icons.person_outline),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Enter your height",
                      hintText: "in feet",
                      icon: Icon(Icons.bar_chart_outlined),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Enter your weight",
                        hintText: "in lbs",
                        icon: Icon(Icons.line_weight_outlined),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: _calculateBMI,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.deepPurple,
                              Colors.purple,
                              Colors.purpleAccent
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('CALCULATE'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: new Text(
                "Your BMI : ${result.toStringAsFixed(1)}",
                style: TextStyle(color: Colors.pink, fontSize: 20),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: new Text(
                "$_status",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontStyle: FontStyle.italic),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
