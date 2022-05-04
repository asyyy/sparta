import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Geolocation static methods
class GeoLoc{

  /// Get location from full address
  static Future<Location?> getLocationFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty){
        return locations.first;
      }
      else{
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  /// Get address from latitude and longitude
  static Future<Placemark?> getAddressFromLocation(double lat, double long) async {
    try {
      List<Placemark> place_marks = await placemarkFromCoordinates(lat, long);
      if (place_marks.isNotEmpty){
        return place_marks.first;
      }
      else{
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  /// Get current position
  static Future<Position?> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied, we cannot request permissions.');
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }
}