import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';



///
/// Widget that allows display intervention
///
class DisplayIntervention extends StatefulWidget {
  const DisplayIntervention({Key? key}) : super(key: key);

  @override
  _DisplayInterventionState createState() => _DisplayInterventionState();
}

class _DisplayInterventionState extends State<DisplayIntervention> {

  // Initialize map controller
  late final MapController mapController;

  // Size of the left panel
  final int leftPaneProportion = 30;

  // Duration of the intervention in seconds
  int interventionDuration = 7200;

  // Map settings
  List<Marker> map_markers = [];
  List<Polyline> map_polylines = [];

  // Temp map markers and lines (not send to bdd)
  List<Polyline> map_displayed_polylines = [];

  // ---- START LEFT PANEL SETTINGS SECTION ----- //
  final _settingsFormKey = GlobalKey<FormState>();
  // ---- END LEFT PANEL SETTINGS SECTION ----- //

  // ---- START DRAWER SECTION ----- //
  final _drawerFormKey = GlobalKey<FormState>();

  // Form attributes
  String _drawerLabelController = "";
  String _drawerTypeController = "Ligne";
  Color _drawerColorController = Colors.red;

  List<Map> availableColors = [
    {'name': 'Rouge', 'value': Colors.red},
    {'name': 'Vert', 'value': Colors.green},
    {'name': 'Bleu', 'value': Colors.blue},
    {'name': 'Noir', 'value': Colors.black},
  ];

  // Map capture (start capture many points)
  bool mapCapture = false;

  // History of taps
  List<LatLng> tapHistory = [];

  // ---- END DRAWER SECTION ----- //

  // ---- START NEW MARKER SECTION ----- //
  final _markerFormKey = GlobalKey<FormState>();
  String _markerLabelController = "";
  IconData _markerTypeController = Icons.directions_car;
  int _markerRotationController = 0;
  double _markerSizeController = 30.0;
  Color _markerColorController = Colors.red;

  List<Map> availableVehicles = [
    {'name': 'Voiture', 'value': Icons.directions_car},
    {'name': 'Camion', 'value': Icons.local_shipping},
  ];

  // ---- END NEW MARKER SECTION ----- //


  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  void _handleTap(TapPosition tapPosition, LatLng latlng) {
    print("Tap " + latlng.toString());
    tapHistory.add(latlng);
    if (mapCapture){
      setState(() {
        map_displayed_polylines = List.from(map_polylines);
        map_displayed_polylines.add(Polyline(
          points: tapHistory,
          strokeWidth: 4.0,
          isDotted: _drawerTypeController == "Ligne" ? false : true,
          color: _drawerColorController,
        ));
      });
    }
    else{
      print("Add new marker");
      openMarkerPopup();
    }
  }

  void startCapture(){
    print("Start capture");
    setState(() {
      mapCapture = true;
      tapHistory = [];
    });
  }

  void stopCapture(){
    print("Stop capture");
    setState(() {
      mapCapture = false;

      // Faire requete

      setState(() {
        // map_polylines = MA REQUETE
        map_polylines = List.from(map_displayed_polylines);
      });

    });
  }

  void cancelCapture(){
    print("Cancel capture");
    setState(() {
      // map_polylines = MA REQUETE
      mapCapture = false;
      map_displayed_polylines = List.from(map_polylines);
    });
  }

  void computeMarker(){
    print("Add new marker");
    Map marker_values = {};
    marker_values["type"] = _markerTypeController;
    marker_values["color"] = _markerColorController;
    marker_values["size"] = _markerSizeController;

    map_markers.add(Marker(
      width: marker_values["size"],
      height: marker_values["size"],
      point: tapHistory.last,
      builder: (ctx) =>
          GestureDetector(
            onTap: () {print("TAPPED : Tap on marker" );},
              child : Container(
            child: Icon(marker_values["type"], color: marker_values["color"], size: marker_values["size"]),
          )),
    ));
    setState(() {
      map_markers;
    });
  }

  openDrawPopup(){
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Dessiner un vecteur'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _drawerFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _drawerLabelController,
                  onChanged: (value) {
                      _drawerLabelController = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Label',
                    icon: Icon(Icons.abc_rounded),
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.border_color),
                  ),
                  value: _drawerTypeController,
                  items: ["Ligne", "Pointillé"].map((label) => DropdownMenuItem(
                    child: Text(label),
                    value: label,
                  )).toList(),
                  onChanged: (value) {
                      if (value != null){
                        _drawerTypeController = value;
                      }
                  },
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.brush_rounded),
                  ),
                  value: _drawerColorController,
                  items: availableColors.map((map) {
                    return DropdownMenuItem(
                      child: Text(map['name']),
                      value: map['value'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null){
                      _drawerColorController = value as Color;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              child: Text("Retour"),
              onPressed: () {
                Navigator.of(context).pop();
                // your code
              }),
          ElevatedButton(
              child: Text("Dessiner"),
              onPressed: () {
                Navigator.of(context).pop();
                startCapture();
              })
        ],
      );
    });
  }

  openMarkerPopup(){
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Ajouter un marqueur'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _markerFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _markerLabelController,
                  onChanged: (value) {
                    _markerLabelController = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Label',
                    icon: Icon(Icons.abc_rounded),
                  ),
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.border_color),
                  ),
                  value: _markerTypeController,
                  items: availableVehicles.map((map) {
                    return DropdownMenuItem(
                      child: Text(map['name']),
                      value: map['value'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null){
                        _markerTypeController = value as IconData;
                      }
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.brush_rounded),
                  ),
                  value: _markerColorController,
                  items: availableColors.map((map) {
                    return DropdownMenuItem(
                      child: Text(map['name']),
                      value: map['value'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null){
                        _markerColorController = value as Color;
                      }
                    });
                  },
                ),
                TextFormField(
                  initialValue: _markerSizeController.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    try {
                      _markerSizeController = double.parse(value);
                    }
                    catch (_) {
                      print("Conversion error"); //String is not an Integer
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Taille',
                    icon: Icon(Icons.expand_more),
                  ),
                ),
                TextFormField(
                  initialValue: _markerRotationController.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _markerRotationController = int.parse(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Angle',
                    icon: Icon(Icons.zoom_in_rounded),
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              child: Text("Retour"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          ElevatedButton(
              child: Text("Valider"),
              onPressed: () {
                computeMarker();
                Navigator.of(context).pop();
              }),
        ],
      );
    });
  }

  getCurrentForm(){
    return Form(
      key: _settingsFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_settingsFormKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                        Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: leftPaneProportion,
          child: Container(
              color: Colors.white,
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: ListView(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            print("Click : Header");
                          },
                          child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: ListTile(
                                title: const Text("Feu Capgemini Rennes"),
                                subtitle: const Text("7 Rue Claude Chappe, 35510 Cesson-Sévigné"),
                                trailing: TweenAnimationBuilder<Duration>(
                                    duration: Duration(seconds: 86400 - interventionDuration),
                                    tween: Tween(begin: Duration(seconds: interventionDuration), end: const Duration(seconds: 86400)),
                                    builder: (BuildContext context, Duration value, Widget? child) {
                                      final hours = value.inHours;
                                      final minutes = value.inMinutes%60;
                                      return Text((hours < 10 ? "0"+hours.toString() : hours.toString())+ ':' + (minutes < 10 ? "0"+minutes.toString() : minutes.toString()), style: const TextStyle(fontWeight: FontWeight.bold));
                                    })),
                          )),
                      const Divider(color: Colors.black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.table_chart_outlined),
                          tooltip: 'Tableau des moyens',
                          onPressed: () {
                              print("Click : Tableau des moyens");
                          },
                        ),
                          IconButton(
                          icon: const Icon(Icons.airplanemode_on),
                          tooltip: 'Vue drone',
                          onPressed: () {
                              print("Click : Tableau des moyens");
                          },
                        ),
                          IconButton(
                          icon: const Icon(Icons.format_list_bulleted),
                          tooltip: 'Liste des interventions',
                          onPressed: () {
                              print("Click : Liste des interventions");
                          },
                        ),
                          IconButton(
                            icon: Icon(mapCapture == true ? Icons.download_done : Icons.border_color_outlined),
                            color: mapCapture == true ? Colors.green : Colors.black,
                            tooltip: 'Dessiner',
                            onPressed: () {
                              print("Click : Dessiner");
                              if (mapCapture){
                                stopCapture();
                              }
                              else{
                                openDrawPopup();
                              }
                            },
                          ),
                          Visibility(
                            child: IconButton(
                              icon: Icon(Icons.delete_outlined),
                              color: Colors.red,
                              tooltip: 'Supprimer',
                              onPressed: () {
                                print("Click : Remove");
                                if (mapCapture){
                                  cancelCapture();
                                }
                              },
                            ),
                            visible: mapCapture,
                          ),
                        ],
                      ),
                      const Divider(color: Colors.black),
                      //SizedBox(height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black))),
                      GestureDetector(
                          onTap: () {
                            print("TAPPED : Retour");
                          },
                          child:
                          Visibility(
                            visible: false,
                              child:Card(
                            child: getCurrentForm(),
                          ))),
                    ],
                  ))),
        ),
        Flexible(
          flex: 100 - leftPaneProportion,
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              plugins: [],
              center: LatLng(48.117266, -1.6777926),
              zoom: 10,
              onTap: _handleTap
            ),
            layers: [
              MarkerLayerOptions(
                  markers: map_markers
              ),
              PolylineLayerOptions(
                polylines: map_displayed_polylines,
              ),
            ],
            children: <Widget>[
              TileLayerWidget(
                options: TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
