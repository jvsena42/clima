import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    location.getCurrentLocation();
  }

  Future<void> getData() async {
    var uri = Uri.https('samples.openweathermap.org', 'data/2.5/weather',{
      'lat': '39',
      'lon': '139',
      'appid': 'b6907d289e10d714a6e88b30761fae22'
    });
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold( );
  }
}
