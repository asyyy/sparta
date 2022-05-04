import 'package:flutter/material.dart';

///
/// Widget that allows login
///
class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child : Center(
            child: Text("ressources table page")
        )
    );
  }

}