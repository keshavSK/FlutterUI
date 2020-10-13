import 'package:flutter/material.dart';
import 'package:flutter_ui_component/presenters/UserListPresenter.dart';
import 'package:flutter_ui_component/responses/UserListResponse.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> implements UserListView {
  bool isLoading = false;
  var userList = List<User>();
  UserListPresenter _userListPresenter;

  @override
  void initState() {
    _userListPresenter = new UserListPresenter(this);
    _userListPresenter.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Stack(
        children: [
          _userBody(context),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
        ],
      ),
    );
  }

  _userBody(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _listItem(userList[index]);
        });
  }

  _listItem(User user) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Text('${user.name}'),
    );
  }

  @override
  void showUserListResponse(UserListResponse response) {
    if (response.status == 200 && response.user.length > 0) {
      setState(() {
        userList = response.user;
      });
    } else {
      print('user data not available');
    }
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showError(String msg) {
    print(msg);
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }
}
