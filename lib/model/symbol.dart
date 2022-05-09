import 'package:projet_groupe_c/model/iconModel.dart';

class SymbolModel {
  /// Implementation of a polygon
  SymbolModel({this.id, this.type, this.interventionId, this.icon});

  String? id;
  int? type;
  String? interventionId;
  IconModel? icon;

  Map<String, dynamic> toJson() => {
        "type": type,
        "interventionId": interventionId,
        "icon": icon!.toJson(),
      };
}
