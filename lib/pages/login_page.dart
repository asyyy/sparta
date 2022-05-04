import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

import 'display_intervention_page.dart';

///
/// Widget that allows login
///
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child : ResponsiveRow(
          children: [
            Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                     image:DecorationImage(
                         image: AssetImage ("images/login.png"),
                         fit: BoxFit.cover),
                  ),
                  child : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.4,
                          color: Colors.white,
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'User Name',
                                        hintText: 'Enter your user name'
                                    ),
                                  ),
                                ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'Enter your secure password'
                                  ),
                                ),
                              ),
                             TextButton(
                               onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) =>  const DisplayIntervention())),
                               child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold),),)
                            ],
                          ),
                        ),
                      ]
                  ),

            ),
          ],
        )
    );
  }

}