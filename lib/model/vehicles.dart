import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:projet_groupe_c/model/iconModel.dart';
import 'globalMarker.dart';

class VehicleModel {
  /// Implementation of a vehicle
  VehicleModel(
      {this.id,
      this.type,
      this.validationState,
      this.departureDate,
      this.arrivedDateEst,
      this.arrivedDateReal,
      this.interventionId,
      this.iconModel});
  String? id;
  int? type;
  int? validationState;
  String? departureDate;
  String? arrivedDateEst;
  String? arrivedDateReal;
  String? interventionId;
  IconModel? iconModel;

  /// Get position of Vehicle
  LatLng getPosition() {
    return iconModel!.getposition();
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
      id: json["_id"],
      type: json["type"],
      validationState: json['validationState'],
      departureDate: json['departureDate'],
      arrivedDateEst: json['arrivedDateEst'],
      arrivedDateReal: json['arrivedDateReal'],
      interventionId: json['interventionId'],
      iconModel: json['iconModel']);

  /// Export InterventionModel as JSON
  Map<String, dynamic> toJson() => {
        "type": type,
        "validationState": validationState,
        "departureDate": departureDate,
        "arrivedDateEst": arrivedDateEst,
        "arrivedDateReal": arrivedDateReal,
        "interventionId": interventionId
      };

  @override
  String toString() {
    return "Name : " +
        iconModel!.label! +
        "\nType de vehicule : " +
        type.toString() +
        "\nValidation : " +
        validationState.toString() +
        "\nLongitude : " +
        iconModel!.longitude.toString() +
        "\nLatitude : " +
        iconModel!.latitude.toString();
  }
}
