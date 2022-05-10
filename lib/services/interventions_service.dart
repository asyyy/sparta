import '../model/intervention.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:convert';
import '../assets/api_constants.dart';
import 'package:http/http.dart' as http;
import '../globals.dart' as globals;

/// Service for Interventions
/// Based on Back End Project
class InterventionsService {
  
  static List<InterventionModel> getInterventionsFromJSON(json){
  List<InterventionModel> interventions = [];
  for(int i = 0; i < json.length ; i++ ) {
    interventions.add(InterventionModel.fromJson(json[i]));
  }
  return interventions;
}
/// Get vehicles Markers from list of InterventionModel
List<Marker> getMarkersFromInterventions(List<InterventionModel> interventions) {
  List<Marker> markers = [];
  for(InterventionModel intervention in interventions){
   // markers.addAll(intervention.getVehiclesMarkers());
  }
  return markers;
}


  static Future getData() async {
    return http.get(Uri.parse(ApiUrl + "/" + ApiCollection),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': globals.token
        });
  }

  static Future getInterventionById(String id) {
    return http.get(
      Uri.parse(ApiUrl + "/" + ApiCollection + "/" + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': globals.token
      },
    );
  }
/*  static Future getInterventionVehicles(String id)
  {
    return http.get(
      Uri.
    )*/
  //}

  static Future<bool> postIntervention(InterventionModel intervention) async {
    bool tmpResult = false;
    await http
        .post(
      Uri.parse(ApiUrl + "/" + ApiCollection),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': globals.token
      },
      body: jsonEncode(intervention.toJson()),
    )
        .then((value) {
      tmpResult = true;
    }).catchError((docSnapshot) {
      tmpResult = false;
    });
    return tmpResult;
  }

  static Future<bool> updateIntervention(InterventionModel intervention) async {
    bool tmpResult = false;
    await http
        .put(
      Uri.parse(ApiUrl + "/" + ApiCollection + "/" + intervention.id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': globals.token
      },
      body: jsonEncode(intervention.toJson()),
    )
        .then((value) {
      tmpResult = true;
    }).catchError((docSnapshot) {
      tmpResult = false;
    });
    return tmpResult;
  }

  static Future<bool> deleteIntervention(InterventionModel intervention) async {
    bool tmpResult = false;

    await http.delete(
        Uri.parse(ApiUrl + "/" + ApiCollection + "/" + intervention.id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': globals.token
        }).then((value) {
      tmpResult = true;
    }).catchError((docSnapshot) {
      tmpResult = false;
    });
    return tmpResult;
  }
  
/// Get list of InterventionModel from JSON

}
