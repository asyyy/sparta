import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_groupe_c/pages/login_page.dart';
import 'package:projet_groupe_c/pages/new_intervention_page.dart';

void main() async{
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
      home: NewInterventionPage(),
    );
  }
}
