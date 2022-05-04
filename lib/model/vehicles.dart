import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../assets/constants.dart';

class VehicleModel {
  /// Implementation of a vehicle
  VehicleModel({required this.name, required this.type, required this.latitude, required this.longitude});
  String name;
  String type;
  double latitude;
  double longitude;

  /// Get position of Vehicle
  LatLng getPosition(){
    return LatLng(latitude, longitude);
  }

  /// Get marker of Vehicle
  Marker getMarker(){
    IconData tmpIcon = MAP_CAR_ICON;

    if(type == "camion"){
      tmpIcon = MAP_TRUCK_ICON;
    }

    return Marker(
      width: 80,
      height: 80,
      point: LatLng(latitude, longitude),
      builder: (ctx) =>
          Container(
            child: Icon(
                tmpIcon,
                color: MAP_VEHICLE_COLOR,
                size: MARKER_SIZE
            ),
          ),
    );
  }

  /// Export InterventionModel as JSON
  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "longitude": longitude,
    "latitude": latitude,
  };

  @override
  String toString(){
    return "Name : "+name+"\nType : "+type+"\nLongitude : "+longitude.toString()+"\nLatitude : "+latitude.toString();
  }
}