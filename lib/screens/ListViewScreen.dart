import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> androidVersionList = [
    "Jelly Bean",
    "Kit Kat",
    "Lollipop",
    "Marshmallow",
    "Nought",
    "Oreo",
    "Pie",
    "Q"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: androidVersionList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _listItem(index);
          }),
    );
  }

  Widget _listItem(int index) {
    return InkWell(
      onTap: () {
        Toast.show('${androidVersionList[index]}', context,
            duration: Toast.LENGTH_LONG);
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              '${androidVersionList[index]}',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            )
          ],
        ),
      ),
    );
    // return ListTile(
    //   onTap: () {
    //     Toast.show('${androidVersionList[index]}', context,
    //         duration: Toast.LENGTH_LONG);
    //   },
    //   subtitle: Text('version'),
    //   leading: Icon(Icons.home),
    //   title: Text('${androidVersionList[index]}'),
    //   trailing: Icon(Icons.keyboard_arrow_right),
    // );
  }
}
