import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


const apiKey = 'b6907d289e10d714a6e88b30761fae22';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    var uri = Uri.https('api.openweathermap.org', 'data/2.5/weather',{
      'lat': '$latitude',
      'lon': '$longitude',
      'appid': apiKey
    });

    var networkHelper = NetworkHelper(uri);
    print(networkHelper.getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( );
  }
}
