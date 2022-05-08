import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:projet_groupe_c/model/globalMarker.dart';


class SymbolModel extends GlobalMarkerModel {
  /// Implementation of a polygon
  SymbolModel({
    required id,
      required label,
      required type,
      required latitude,
      required longitude,
      required size,
      required this.sinisterType,
      required this.orientation,
      required interventionId
  })
  :super(
    id: id,
    label: label,
    type: type ,
    latitude: latitude,
    longitude: longitude,
    size: size,
    interventionId: interventionId
  );

  int sinisterType;
  double orientation = 0;

  /// Get marker of Vehicle
  Marker getMarker({listener}) {
    String iconPath = "images/icons_interventions/arrows/curvedArrow.png";
    if (type == 0){
      iconPath = "images/icons_interventions/arrows/circleArrow.png";
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

    return Marker(
      width: size,
      height: size,
      point: LatLng(latitude, longitude),
      builder: (ctx) => GestureDetector(
        onTap: () {
          print("Click on " + id);
          if (listener != null){
            listener(this);
          }
        },
          child: Transform.rotate(
              angle: orientation,
              child: ImageIcon(
            AssetImage(iconPath),
            size: size,
            color: color,
          )
        //child: Icon(Icons.directions_car, color: Colors.red, size: size),
        )),
    );
  }
}