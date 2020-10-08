import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_component/screens/NavigationDrawerScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> users = <Item>[
    const Item("1", 'Android'),
    const Item("2", 'Flutter'),
    const Item("3", 'ReactNative'),
    const Item("4", 'iOS'),
  ];
  var selectedDropDownValue;
  Item selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1.0),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: DropdownButton<Item>(
                  value: selectedUser,
                  hint: Text("Select item"),
                  isDense: false,
                  items: users.map((Item user) {
                    return new DropdownMenuItem(
                      child: Text(user.name),
                      value: user,
                    );
                  }).toList(),
                  onChanged: (Item value) {
                    setState(() {
                      selectedUser = value;
                    });
                  }),
            )
          ],
        ),
      ),
      drawer: NavigationDrawerScreen(),
    );
  }
}

class Item {
  const Item(this.id, this.name);

  final String id;
  final String name;
}
