import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class PolygonModel {
  /// Implementation of a polygon
  PolygonModel(
      {this.id,
      required this.label,
      required this.points,
      required this.color,
      required this.dotted,
      required this.interventionId});
  String? id;
  String label;
  List<LatLng> points;
  Color color;
  bool dotted;
  String interventionId;
  double thickness = 4.0;

  /// Get marker of Vehicle
  Polyline getPolyline() {
    return Polyline(
      points: points,
      strokeWidth: thickness,
      isDotted: dotted,
      color: color,
    );
  }

  Map<String, dynamic> toJson() => {
        "label": label,
        "points": points,
        "color": color,
        "dotted": dotted,
        "interventionId": interventionId,
        "thickness": thickness,
      };
}
