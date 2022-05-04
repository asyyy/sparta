import 'package:flutter/material.dart';

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
        child : Row(
          children: [
            Column (
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                 Image.asset(

                    'images/login.png',
                  ),
                  Text ("loginpage"),
                ]
            ),
            Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text ("loginpage"),
                ]
            ),
          ],
        )
    );
  }

}