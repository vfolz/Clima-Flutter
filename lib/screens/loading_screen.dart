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
    Map locationMap =  await location.getCurrentLocation();
    lat = locationMap['latitude'];
    lon = locationMap['longitude'];

    String url = 'https://api.openweathermap.org/data/2.5/weather?lat='+
        lat.toString() +'&lon=' + lon.toString() + '&appid='+kApiKey;

    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getData();

    var temperature = data['main']['temp'];
    var condition = data['weather'][0]['main'];
    var cityName = data['name'];

    print(condition);
    print (cityName);
    print(temperature);
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
