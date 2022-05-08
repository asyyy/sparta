import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'globalMarker.dart';

class VehicleModel extends GlobalMarkerModel{
  /// Implementation of a vehicle
  VehicleModel({
    required id,
    required name,
    required vehicleType,
    required this.sinisterType,
    required this.validationState,
    required latitude,
    required longitude,
    required this.departureDate,
    required this.arrivedDateEst,
    required this.arrivedDateReal,
    required interventionId
  }):super(
      id: id,
      label: name,
      type: vehicleType ,
      latitude: latitude,
      longitude: longitude,
      size: 30,
      interventionId: interventionId
  );
  int sinisterType;
  int validationState;
  String departureDate;
  String arrivedDateEst;
  String arrivedDateReal;

  /// Get position of Vehicle
  LatLng getPosition() {
    return LatLng(latitude, longitude);
  }

  /// Get marker of Vehicle
  Marker getMarker({listener}) {
    //TODO modifier avec les icones prévu
    IconData icon = Icons.directions_car;
    switch (type) {
      case 0:
        icon = Icons.directions_car;
        break;
      case 1:
        icon = Icons.local_shipping;
        break;
    }
    Color color = Colors.white;
    switch (sinisterType) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.green;
        break;
      case 2:
        color = Colors.orange;
        break;
    }

    // switch (validationState) {
    //   case 0:
    //     icon += '_req';
    //     break;
    //   case 1:
    //     icon += '_here';
    //     break;
    //   case 2:
    //     break;
    // }
    //TODO : mettre le svg correspondant au path icon

    return Marker(
      rotate: true,
      width: size,
      height: size,
      point: LatLng(latitude, longitude),
      builder: (ctx) => GestureDetector(
        onTap: () {
          print("Click on " + label);
          if (listener != null){
            listener(this);
          }
        },
        child: Icon(icon, color: color, size: size),
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
        "name": label,
        "vehicleType": type,
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
        label +
        "\nType de vehicule : " +
        type.toString() +
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
