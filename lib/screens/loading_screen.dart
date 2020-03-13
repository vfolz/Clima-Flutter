import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



void getLocation () async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  print(position);
}


class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState(){
    super.initState();
    getLocation();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
