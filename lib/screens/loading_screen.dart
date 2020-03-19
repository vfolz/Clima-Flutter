import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;

  void getLocation() async{
    WeatherModel weatherModel = WeatherModel();
    var data  = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationData: data)));
  }

  @override
  void initState(){
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        )

      )


    );
  }
}
