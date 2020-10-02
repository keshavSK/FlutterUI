import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/google_logo.png'),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20.0, top: 15.0, bottom: 15.0, right: 20.0),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  controller: emailController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20.0, top: 15.0, bottom: 15.0, right: 20.0),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
