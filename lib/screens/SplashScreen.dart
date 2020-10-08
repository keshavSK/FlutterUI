import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_component/screens/HomeScreen.dart';
import 'package:flutter_ui_component/screens/RegistrationScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/splash_screen.png'), fit: BoxFit.cover),
      ),
    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => RegistrationScreen()));
  }
}
