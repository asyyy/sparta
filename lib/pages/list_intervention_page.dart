//import 'dart:html';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

import 'package:projet_groupe_c/pages/loading_page.dart';
import 'package:projet_groupe_c/pages/login_page.dart';
import 'package:projet_groupe_c/pages/new_intervention_page.dart';
import '../services/interventions_service.dart';

import '../model/intervention.dart';

///
/// Widget that allows display intervention
///
class ListIntervention extends StatefulWidget {
  const ListIntervention({Key? key}) : super(key: key);
  @override
  _ListInterventionState createState() => _ListInterventionState();
}


class _ListInterventionState extends State<ListIntervention> {

  late AppBar appBar;
  late final MapController mapController ;
  late List<InterventionModel> interventions = [];

  _getInterventions(){
  InterventionsService.getData().then((response) {
      setState(() {
        interventions = InterventionsService.getInterventionsFromJSON(json.decode(response.body));
      });
    });
    print("iciiiiii" + interventions.toString());
  }




  @override
  void initState() {
    super.initState();
    _getInterventions();
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
    mapController = MapController();
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
                    itemCount: interventions.length,
                    itemBuilder: (context, position) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            interventions[position].label,
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
                    height: MediaQuery.of(context).size.height*0.85-appBar.preferredSize.height,
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
                    )
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom : 0.0, right: 30.0, left: 30.0),
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
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
