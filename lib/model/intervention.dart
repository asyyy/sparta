
import 'package:latlong2/latlong.dart';
import 'package:projet_groupe_c/model/vehicles.dart';


class InterventionModel {
  /// Implementation of an intervention
  InterventionModel(
      {required this.id,
      required this.label,
      required this.startDate,
      this.vehicles,
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
  String? endDate;
  List<VehicleModel>? vehicles;
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
          vehicles: List.generate(
              json['vehicles'].length,
              (index) => VehicleModel(
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
                  latitude: json['latitude'])),

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
        "longitude": longitude,
        "latitude": latitude,
      };

  List<Map<String, dynamic>> vehiclesToJson() {
    final vehicles = this.vehicles;
    if(vehicles != null){
      return List.generate(vehicles.length, (index) => vehicles[index].toJson());
    }
    else{
      return [];
    }

  }

  /// Return InterventionModel as String
  String vehiclesToString() {
    var vToS = "";
    for (VehicleModel v in vehicles!) {
      vToS += "name:" +
          v.name +
          "\nType de vehicule : " +
          v.vehicleType.toString() +
          "\nType de sinistre : " +
          v.sinisterType.toString() +
          "\nValidation : " +
          v.validationState.toString() +
          "\nLongitude : " +
          v.longitude.toString() +
          "\nLatitude : " +
          v.latitude.toString();
    }
    return vToS;
  }

/*  /// Get list of markers for each vehicles
  List<Marker> getVehiclesMarkers() {
    List<Marker> markers = [];
    for (VehicleModel v in vehicles) {
      markers.add(v.getMarker());
    }
    return markers;
  }*/

  /// Get position of intervention
  LatLng getposition() {
    return LatLng(latitude, longitude);
  }
}



