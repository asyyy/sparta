import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Example of use in a Stateful Widget :

/// _getPosition() {
///   GeoLoc.getCurrentPosition().then((response) {
///     print("Response " + response.toString());
///     setState(() {
///        my_lat = response.latitude;
///        my_long = response.longitude;
///     });
///
///   });
/// }

/// Geolocation static methods
class GeoLoc {
  /// Get location from full address
  /// Returns the Location or Null otherwise
  static Future<Location?> getLocationFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return locations.first;
      } else {
        print("No coordinates found for the given address.");
        return null;
      }
    } on Exception catch (_) {
      print("Error during address conversion.");
      return null;
    }
  }

  /// Get address from latitude and longitude
  /// Returns the Placemark or Null otherwise
  static Future<Placemark?> getAddressFromLocation(
      double lat, double long) async {
    try {
      List<Placemark> place_marks = await placemarkFromCoordinates(lat, long);
      if (place_marks.isNotEmpty) {
        return place_marks.first;
      } else {
        print("No address found for the given coordinates.");
        return null;
      }
    } on Exception catch (_) {
      print("Error during address conversion.");
      return null;
    }
  }

  /// Get current position
  /// Returns the Position or Null otherwise
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
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }
}
