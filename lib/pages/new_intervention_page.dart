import 'package:flutter/material.dart';

///
/// Widget that allows create new intervention
///
class NewInterventionPage extends StatefulWidget {
  const NewInterventionPage({Key? key}) : super(key: key);
  @override
  _NewInterventionPageState createState() => _NewInterventionPageState();
}

class _NewInterventionPageState extends State<NewInterventionPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child : Center(
            child: Text("new intervention page")
        )
    );
  }

}