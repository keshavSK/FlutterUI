import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_component/presenters/UserSignUpPresenter.dart';
import 'package:flutter_ui_component/responses/UserSignUpResponse.dart';
import 'package:toast/toast.dart';

class UserSignUpScreen extends StatefulWidget {
  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen>
    implements UserSignUpView {
  bool isLoading = false;
  var nameController = new TextEditingController();
  var emailController = new TextEditingController();
  var mobileController = new TextEditingController();
  var addressController = new TextEditingController();
  var passwordController = new TextEditingController();
  UserSignUpPresenter _signUpPresenter;

  @override
  void initState() {
    _signUpPresenter = new UserSignUpPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Stack(
        children: [
          _signBody(context),
          isLoading ? Center(child: CircularProgressIndicator()) : Container()
        ],
      ),
    );
  }

  _signBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Name', labelText: 'Name'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Mobile', labelText: 'Mobile'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  InputDecoration(hintText: 'Email', labelText: 'Email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: addressController,
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration(hintText: 'Address', labelText: 'Address'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration:
                  InputDecoration(hintText: 'Password', labelText: 'Password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                _saveUser(context);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }

  void _saveUser(BuildContext context) {
    _signUpPresenter.signUp(
        nameController.text.toString().trim(),
        emailController.text.toString().trim(),
        mobileController.text.toString().trim(),
        addressController.text.toString().trim(),
        passwordController.text.toString().trim(),
        "1",
        "1",
        "5");
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showError(String msg) {
    showLongToast(context, msg);
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void showSignUpResponse(UserSignUpResponse response) {
    if (response.status == 200 && response.user != null) {
      showLongToast(context, response.message);
      setState(() {
        nameController.text = "";
        mobileController.text = "";
        emailController.text = "";
        addressController.text = "";
        passwordController.text = "";
      });
    } else {
      showLongToast(context, response.message);
    }
  }

  static void showLongToast(BuildContext context, String message) {
    Toast.show(message, context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
        textColor: Colors.white,
        backgroundColor: Colors.grey[700]);
  }
}
