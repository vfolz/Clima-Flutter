
import 'package:geolocator/geolocator.dart';

class Location{

  Map _locationMap = Map();


  Future<Map> getCurrentLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      _locationMap['latitude'] =  position.latitude;
      _locationMap['longitude'] = position.longitude;
      return _locationMap;

    }
    catch(e){
      print (e);
      return _locationMap;

    }
  }
}