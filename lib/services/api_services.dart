import 'dart:convert';
import 'package:projet_groupe_c/model/intervention.dart';
import '../assets/api_constants.dart';
import 'package:http/http.dart' as http;

/// Service for API
/// Based on Back End Project
class ApiService{

  static Future getData() async {
    return http.get(Uri.parse(ApiUrl + "/" + ApiCollection));
  }

  static Future getInterventionById(String id) {
    return http.get(Uri.parse(ApiUrl + "/" + ApiCollection+"/" + id));
  }

  static Future<bool> postIntervention(InterventionModel intervention) async {
    bool tmpResult = false;
    await http.post(Uri.parse(ApiUrl + "/" + ApiCollection),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(intervention.toJson()),
    ).then((value) {
      tmpResult = true;
    }).catchError((docSnapshot) {
      tmpResult = false;
    });
    return tmpResult;
  }

  static Future<bool> updateIntervention(InterventionModel intervention) async{
    bool tmpResult = false;
    await http.put(Uri.parse(ApiUrl + "/" + ApiCollection + "/" + intervention.id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(intervention.toJson()),
    ).then((value) {
      tmpResult = true;
    }).catchError((docSnapshot) {
      tmpResult = false;
    });
    return tmpResult;
  }

  static Future<bool> deleteIntervention(InterventionModel intervention) async {
    bool tmpResult = false;

    await http.delete(Uri.parse(ApiUrl + "/" + ApiCollection + "/" + intervention.id)).then((value) {
      tmpResult = true;
    }).catchError((docSnapshot) {
      tmpResult = false;
    });
    return tmpResult;
  }


}