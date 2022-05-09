import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';

class IconModel {
  /// Implementation of a polygon
  IconModel({
    this.orientation,
    this.size,
    this.label,
    this.latitude,
    this.longitude,
  });
  double? orientation;
  double? size;
  String? label;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() => {
        "orientation": orientation,
        "size": size,
        "latitude": latitude,
        "longitude": longitude,
        "label": label
      };

  /// Get marker of Vehicle
  Marker getMarker({listener}) {
    //TODO modifier avec les icones prévu
    IconData icon = Icons.directions_car;
    switch (listener.type) {
      case 0:
        icon = Icons.directions_car;
        break;
      case 1:
        icon = Icons.local_shipping;
        break;
    }
    Color color = Colors.white;
    switch (listener.sinisterType) {
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
      width: size!,
      height: size!,
      point: getposition(),
      builder: (ctx) => GestureDetector(
        onTap: () {
          print("Click on " + label!);
          if (listener != null) {
            listener(this);
          }
        },
        child: Icon(icon, color: color, size: size),
      ),
    );
  }

  LatLng getposition() {
    return LatLng(latitude!, longitude!);
  }
}
