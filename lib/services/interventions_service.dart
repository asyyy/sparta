import '../model/intervention.dart';

/// Get list of InterventionModel from JSON
List<InterventionModel> getInterventionsFromJSON(json){
  List<InterventionModel> interventions = [];
  for(var d in json){
    interventions.add(InterventionModel.fromJson(d));
  }
  return interventions;
}
