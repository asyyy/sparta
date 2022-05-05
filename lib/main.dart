import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_groupe_c/pages/display_intervention_page.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;

void main() async {
  globals.token = '';
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    return MaterialApp(
      title: 'Flutter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayIntervention(),
    );
  }
}
