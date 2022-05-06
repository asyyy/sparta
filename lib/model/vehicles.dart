import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../assets/constants.dart';

class VehicleModel {
  /// Implementation of a vehicle
  VehicleModel(
      {required this.id,
      required this.name,
      required this.vehicleType,
      required this.sinisterType,
      required this.validationState,
      required this.latitude,
      required this.longitude,
      required this.departureDate,
      required this.arrivedDateEst,
      required this.arrivedDateReal,
      required this.interventionId});
  String name;
  String id;
  int vehicleType;
  int sinisterType;
  int validationState;
  double latitude;
  double longitude;
  String departureDate;
  String arrivedDateEst;
  String arrivedDateReal;
  String interventionId;

  /// Get position of Vehicle
  LatLng getPosition() {
    return LatLng(latitude, longitude);
  }

  /// Get marker of Vehicle
  Marker getMarker() {
    //TODO modifier avec les icones prévu
    String icon = '';
    switch (vehicleType) {
      case 0:
        icon = 'Camion';
        break;
      case 1:
        break;
      case 2:
        break;
    }
    Color color = Colors.white;
    switch (sinisterType) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        break;
      case 2:
        break;
    }

    switch (validationState) {
      case 0:
        icon += '_req';
        break;
      case 1:
        icon += '_here';
        break;
      case 2:
        break;
    }
    //TODO : mettre le svg correspondant au path icon
    IconData tmpIcon = new IconData(0);
    return Marker(
      width: 80,
      height: 80,
      point: LatLng(latitude, longitude),
      builder: (ctx) => Container(
        child: Icon(tmpIcon, color: color, size: MARKER_SIZE),
      ),
    );
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
      id: json["_id"],
      name: json['name'],
      sinisterType: json['sinisterType'],
      vehicleType: json['vehicleType'],
      validationState: json['validationState'],
      departureDate: json['departureDate'],
      arrivedDateEst: json['arrivedDateEst'],
      arrivedDateReal: json['arrivedDateReal'],
      interventionId: json['interventionId'],
      longitude: json['longitude'],
      latitude: json['latitude']);

  /// Export InterventionModel as JSON
  Map<String, dynamic> toJson() => {
        "name": name,
        "vehicleType": vehicleType,
        "sinisterType": sinisterType,
        "validationState": validationState,
        "departureDate": departureDate,
        "arrivedDateEst": arrivedDateEst,
        "arrivedDateReal": arrivedDateReal,
        "longitude": longitude,
        "latitude": latitude,
        "interventionId": interventionId
      };

  @override
  String toString() {
    return "Name : " +
        name +
        "\nType de vehicule : " +
        vehicleType.toString() +
        "\nType de sinistre : " +
        sinisterType.toString() +
        "\nValidation : " +
        validationState.toString() +
        "\nLongitude : " +
        longitude.toString() +
        "\nLatitude : " +
        latitude.toString();
  }
}
