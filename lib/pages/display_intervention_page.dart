//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:projet_groupe_c/pages/loading_page.dart';
import 'package:projet_groupe_c/pages/login_page.dart';
import 'package:projet_groupe_c/pages/new_intervention_page.dart';

///
/// Widget that allows display intervention
///
class DisplayIntervention extends StatefulWidget {
  const DisplayIntervention({Key? key}) : super(key: key);
  @override
  _DisplayInterventionState createState() => _DisplayInterventionState();
}

class _DisplayInterventionState extends State<DisplayIntervention> {
  late AppBar appBar;
  late final MapController mapController;
  @override
  void initState() {
    super.initState();
    appBar = AppBar(
      title: const Text("Interventions"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const LoginPage()))
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0,),
          child: IconButton(
            icon: const Icon(
              Icons.add_circle_outlined,
              color: Colors.white,
              size: 45,
            ),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NewInterventionPage()))
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height -
                      appBar.preferredSize.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, position) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            position.toString(),
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: LatLng(48.117266, -1.6777926),
                      zoom: 10,  ),  children: <Widget>[
                    TileLayerWidget(
                      options: TileLayerOptions(
                        urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                      ),
                    ),
                  ],
                  )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                        const LoadingPage()))
                        },
                    child: const Text(
                      "Rejoindre l'intervention",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
