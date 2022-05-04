import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

///
/// Widget that allows display intervention
///
class DisplayIntervention extends StatefulWidget {
  const DisplayIntervention({Key? key}) : super(key: key);

  @override
  _DisplayInterventionState createState() => _DisplayInterventionState();
}

class _DisplayInterventionState extends State<DisplayIntervention> {
  final int paneProportion = 30;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: paneProportion,
          child: Container(
              color: Colors.white,
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: ListView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            print("Click : Header");
                          },
                          child: const Card(
                            child: ListTile(
                                title: Text("Feu Capgemini Rennes"),
                                subtitle: Text(
                                    "7 Rue Claude Chappe, 35510 Cesson-Sévigné"),
                                trailing: Text("2:32")),
                          )),
                      GestureDetector(
                          onTap: () {
                            print("Click : Tableau des moyens");
                          },
                          child: const Card(
                              child: ListTile(
                                  title: Text("Tableau des moyens"),
                                  trailing: Icon(
                                      Icons.arrow_circle_right_outlined)))),
                      GestureDetector(
                          onTap: () {
                            print("Click : Drone view");
                          },
                          child: const Card(
                              child: ListTile(
                                  title: Text("Vue drone"),
                                  trailing: Icon(
                                      Icons.arrow_circle_right_outlined)))),
                      GestureDetector(
                          onTap: () {
                            print("Click : Interventions list");
                          },
                          child: const Card(
                              child: ListTile(
                                  title: Text("Liste des interventions"),
                                  trailing: Icon(
                                      Icons.arrow_circle_right_outlined)))),
                      //SizedBox(height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black))),
                      GestureDetector(
                          onTap: () {
                            print("Click : Draw");
                          },
                          child: const Card(
                            child: ListTile(
                                title: Text("Dessiner"),
                                trailing: Icon(Icons.border_color_outlined)),
                            margin: EdgeInsets.only(bottom: 5),
                          )),
                      //SizedBox(height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black))),
                      GestureDetector(
                          onTap: () {
                            print("Click : Retour");
                          },
                          child: Card(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
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
                                  TextFormField(
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
                                  TextFormField(
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
                                  TextFormField(
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
                                  TextFormField(
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
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
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
                            ),
                          )),
                    ],
                  ))),
        ),
        Flexible(
          flex: 100 - paneProportion,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(48.117266, -1.6777926),
              zoom: 10,
            ),
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
