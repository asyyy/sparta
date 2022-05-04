import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:projet_groupe_c/model/vehicles.dart';


class InterventionModel {
  /// Implementation of an intervention
  InterventionModel({required this.id, required this.name, required this.date, required this.state, required this.vehicles, required this.longitude, required this.latitude});
  String id;
  String name;
  String date;
  int state;
  List<VehicleModel> vehicles;
  double longitude;
  double latitude;

  /// Create InterventionModel from JSON
  factory InterventionModel.fromJson(Map<String, dynamic> json) => InterventionModel(
    id: json["_id"],
    name: json['name'],
    date: json['date'],
    state: json['state'],
    vehicles: List.generate(json['vehicles'].length, (index) => VehicleModel(name: json['vehicles'][index]["name"], type: json['vehicles'][index]["type"], latitude: json['vehicles'][index]["latitude"], longitude: json['vehicles'][index]["longitude"])),
    longitude: json['longitude'],
    latitude: json['latitude']
  );

  /// Export InterventionModel as JSON
  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "state": state,
    "vehicles": vehiclesToJson(),
    "longitude": longitude,
    "latitude": latitude,
  };

  List<Map<String, dynamic>> vehiclesToJson(){
    return List.generate(vehicles.length, (index) => vehicles[index].toJson());
  }

  /// Return InterventionModel as String
  String vehiclesToString(){
    var vToS = "";
    for(VehicleModel v in vehicles) {
      vToS += "name:" + v.name + "\ntype:" + v.type + "\nlatitude:" + v.latitude.toString() + "\nlongitude:" +v.longitude.toString() + "\n";
    }
      return vToS;
  }

  /// Get list of markers for each vehicles
  List<Marker> getVehiclesMarkers(){
    List<Marker> markers = [];
    for(VehicleModel v in vehicles){
      markers.add(v.getMarker());
    }
    return markers;
  }

  /// Get position of intervention
  LatLng getposition(){
    return LatLng(latitude, longitude);
  }
}