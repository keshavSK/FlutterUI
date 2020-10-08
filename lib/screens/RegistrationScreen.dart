import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            )
          ],
        ),
      ),
    );
  }
}

class AndroidVersion {
  String versionId;
  String versionName;

  AndroidVersion(this.versionId, this.versionName);
}
