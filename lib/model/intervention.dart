
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:projet_groupe_c/model/symbol.dart';
import 'package:projet_groupe_c/model/polygon.dart';
import 'package:projet_groupe_c/model/vehicles.dart';


class InterventionModel {
  /// Implementation of an intervention
  InterventionModel(
      {required this.id,
      required this.label,
      required this.startDate,
      required this.longitude,
      required this.latitude,
        this.endDate,
        this.adress,
        this.version
      });
  String? adress;
  String id;
  String label;
  String startDate;
  List<VehicleModel> vehicles = [];
  List<SymbolModel> symbols = [];
  List<PolygonModel> polygons = [];
  String? endDate;

  double longitude;
  double latitude;
  int? version;


  /// Create InterventionModel from JSON
  factory InterventionModel.fromJson(Map<String, dynamic> json) =>
      InterventionModel(
          id: json["_id"],
          label: json['label'],
          startDate: json['startDate'],
          endDate: json['endDate'],
          // vehicles: List.generate(
          //     json['vehicles'].length,
          //     (index) => VehicleModel(
          //         id: json["_id"],
          //         name: json['name'],
          //         sinisterType: json['sinisterType'],
          //         vehicleType: json['vehicleType'],
          //         validationState: json['validationState'],
          //         departureDate: json['departureDate'],
          //         arrivedDateEst: json['arrivedDateEst'],
          //         arrivedDateReal: json['arrivedDateReal'],
          //         interventionId: json['interventionId'],
          //         longitude: json['longitude'],
          //         latitude: json['latitude'])),

          adress: json['labelAddress'],
          longitude: double.parse(json['longitude']),
          latitude: double.parse(json['latitude']),
          version: json["_v"]);

  /// Export InterventionModel as JSON
  Map<String, dynamic> toJson() => {
        "label": label,
        "startDate": startDate,
        "endDate": endDate,
        "vehicles": vehiclesToJson(),
        "symboles": symbolToJson(),
        "polygon": polygonToJson(),
        "longitude": longitude,
        "latitude": latitude,
      };

  List<Map<String, dynamic>> vehiclesToJson() {
    return List.generate(
        vehicles.length, (index) => vehicles[index].toJson());
  }

  List<Map<String, dynamic>> symbolToJson() {
    return List.generate(symbols.length, (index) => symbols[index].toJson());
  }

  List<Map<String, dynamic>> polygonToJson() {
    return List.generate(
        polygons.length, (index) => polygons[index].toJson());
  }

  /// Return InterventionModel as String
  String vehiclesToString() {
    var vToS = "";
    for (VehicleModel v in vehicles) {
      vToS += "name:" +
          v.iconModel.label +
          "\nType de vehicule : " +
          v.type.toString() +
          "\nValidation : " +
          v.validationState.toString() +
          "\nLongitude : " +
          v.iconModel.longitude.toString() +
          "\nLatitude : " +
          v.iconModel.latitude.toString();
    }
    return vToS;
  }

  /// Get list of markers for each vehicles
  List<Marker> getVehiclesMarkers({listener}) {
    List<Marker> markers = [];
    for (VehicleModel v in vehicles) {
      markers.add(v.iconModel.getMarker(listener: listener));
    }
    return markers;
  }

  /// Get list of markers for each marker
  List<Marker> getSymbolsMarkers({listener}) {
    List<Marker> tmpsymbols = [];
    for (SymbolModel m in symbols) {
      tmpsymbols.add(m.icon.getMarker(listener: listener));
    }
    return tmpsymbols;
  }

  /// Get list of markers for each marker
  List<Polyline> getPolygonPolyline() {
    List<Polyline> tmpPolygons = [];
    for (PolygonModel p in polygons) {
      tmpPolygons.add(p.getPolyline());
    }
    return tmpPolygons;
  }

  /// Get position of intervention
  LatLng getposition() {
    return LatLng(latitude, longitude);
  }

  List<Marker> getAllMarkers({listener}) {
    List<Marker> allMarkers = [];
    allMarkers.addAll(getVehiclesMarkers(listener: listener));
    allMarkers.addAll(getSymbolsMarkers(listener: listener));
    return allMarkers;
  }
}
