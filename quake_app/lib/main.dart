import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
Map _data;
List _features;
void main() async{
 _data = await getQuakes(); 
 _features = _data['features'];
  runApp(new MaterialApp(title: 'Quakes', home: new Quakes()));
}

class Quakes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: new AppBar(
                         title: new Text("QUAKES",style: new TextStyle(color:Colors.white,fontSize: 25, fontWeight: FontWeight.w500), ),
                         centerTitle : false,
                         backgroundColor: Colors.green
                    ),
                    backgroundColor: Colors.green[50],
                    body: new Center(
                        child: ListView.builder(
                               itemCount: _features.length,
                              padding: const EdgeInsets.all(15.0) ,
                              itemBuilder: (BuildContext context, int position){
                                  return new ListTile(
                                    title : new Text("${ _data['features'][position]['properties']['place']}",),
                                  );
                              
                              },
                        ), 
                   
                   
                   ),

    );
  }
}

Future<Map>getQuakes()async{
  String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(apiUrl);
  return jsonDecode(response.body);
}