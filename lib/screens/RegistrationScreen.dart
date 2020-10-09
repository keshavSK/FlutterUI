import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_component/screens/AttachementScreen.dart';
import 'package:image_picker/image_picker.dart';

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
  List<AndroidVersion> androidVersionList = <AndroidVersion>[
    AndroidVersion("1", "Jelly Bean"),
    AndroidVersion("2", "Kit Kat"),
    AndroidVersion("3", "Lollipop"),
    AndroidVersion("4", "Marshmallow"),
    AndroidVersion("5", "Nought"),
  ];
  AndroidVersion version;
  File _selectedFile;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton<AndroidVersion>(
              hint: Text('Select Version'),
              value: version,
              items: androidVersionList.map((e) {
                return new DropdownMenuItem(
                  value: e,
                  child: Text(e.versionName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  version = value;
                });
              },
            ),
            version == null
                ? Container()
                : Text(
                    'Selected Version :${version.versionId} : ${version.versionName}'),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Hello flutter I'm new this framework. Hello flutter I'm new this framework  ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Hello flutter",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Hello flutter ",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Hello flutter ",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              color: Colors.green,
              child: Text('Browse Image'),
            ),
            SizedBox(
              height: 10.0,
            ),
            _selectedFile == null
                ? Container()
                : Image.file(
                    _selectedFile,
                    height: 200.0,
                  )
          ],
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AttachementScreen(
          valueChanged: (value) {
            if (value != null) {
              setState(() {
                PickedFile file = value;
                _selectedFile = new File(file.path);
              });
            }
          },
        );
      },
    );
  }
}

class AndroidVersion {
  String versionId;
  String versionName;

  AndroidVersion(this.versionId, this.versionName);
}
