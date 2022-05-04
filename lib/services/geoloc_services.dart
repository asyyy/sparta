import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
<<<<<<< HEAD
  /// Returns the Position or Null otherwise
=======
>>>>>>> Add method to get current location to geoloc_services.dart
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
<<<<<<< HEAD
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
=======
      print('Location permissions are permanently denied, we cannot request permissions.');
>>>>>>> Add method to get current location to geoloc_services.dart
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> Add method to get current location to geoloc_services.dart
