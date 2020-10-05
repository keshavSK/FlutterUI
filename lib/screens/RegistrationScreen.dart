import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_component/Utils/Contants.dart';

class RegistrationScreen extends StatefulWidget {
  final String username;
  final String password;

  const RegistrationScreen({Key key, this.username, this.password})
      : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var emailController;
  String username, password;

  @override
  void initState() {
    username = widget.username;
    password = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(70, 5)),
              border: Border.all(color: Colors.deepOrange, width: 10),
              color: Colors.green),
          margin: EdgeInsets.all(8.0),
          padding:
              EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: Row(
            children: [
              Text(
                '$username',
                style: TextStyle(fontSize: 20.0, color: colorRed),
              ),
              Expanded(
                child: Text(
                  'Kotlin $password',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
              Expanded(
                child: Text(
                  'Java',
                  style: TextStyle(fontSize: 20.0, color: colorRed),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
