import 'package:flutter/material.dart';
import 'package:flutter_ui_component/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

/*class FontsScreen extends StatefulWidget {
  @override
  _FontsScreenState createState() => _FontsScreenState();
}

class _FontsScreenState extends State<FontsScreen> {
  var usernameController = new TextEditingController();
  var passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Flutter Custom Fonts',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Flutter Custom Fonts',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontFamily: 'Open Sans'),
                ),
              ],
            ),
          ),
        ));
  }
}*/
