import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_component/screens/ListViewScreen.dart';

class NavigationDrawerScreen extends StatefulWidget {
  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/icon_user.png',
                        height: 70.0,
                        width: 70.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Keshav Katad'),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('kkatd@gmail.com')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => ListViewScreen()));
            },
            leading: Icon(
              Icons.account_box,
              color: Colors.black,
            ),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('images/customer.svg',),
            title: Text(
              'Contact Us',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            title: Text(
              'LogOut',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          )
        ],
      ),
    ));
  }
}
