import 'package:flutter/material.dart';

///
/// Widget that allows display intervention
///
class DisplayIntervention extends StatefulWidget {
  const DisplayIntervention({Key? key}) : super(key: key);
  @override
  _DisplayInterventionState createState() => _DisplayInterventionState();
}

class _DisplayInterventionState extends State<DisplayIntervention> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child : Center(
            child: Text("display intervention")
        )
    );
  }

}