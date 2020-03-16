import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;

  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();

    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$kApiKey&units=imperial';

    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getData();
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
