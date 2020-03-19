
import 'package:geolocator/geolocator.dart';

class Location{

  Map _locationMap = Map();
  double _latitude;
  double _longitude;

  Future<void> getCurrentLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      _latitude =  position.latitude;
      _longitude = position.longitude;
    }
    catch(e){
      print (e);
    }
  }
  double getLatitude (){
    return _latitude;
  }

  double getLongitude(){
    return _longitude;
  }

}