import 'package:geocoding/geocoding.dart';

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

}