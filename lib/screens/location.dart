
import 'package:geolocator/geolocator.dart';
class Location{
  double latitude = 0;
  double longitude = 0;

  Future<void> getLocationLL() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: false,
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e){
      print(e);
    }
  }

}