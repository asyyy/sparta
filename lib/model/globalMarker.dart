class GlobalMarkerModel {
  /// Implementation of a polygon
  GlobalMarkerModel(
      {required this.id,
      required this.label,
      required this.type,
      required this.latitude,
      required this.longitude,
      required this.size,
      required this.interventionId});
  String id;
  String label;
  int type;
  double latitude;
  double longitude;
  double size;
  String interventionId;

  Map<String, dynamic> toJson() => {
        "label": label,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "size": size,
        "interventionId": interventionId,
      };
}
