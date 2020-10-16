import 'package:flutter/material.dart';
import 'package:flutter_ui_component/presenters/UserPostPresenter.dart';
import 'package:flutter_ui_component/responses/UserPostResponse.dart';

class UserPostScreen extends StatefulWidget {
  @override
  _UserPostScreenState createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen>
    implements GetUserPostView {
  bool isLoading = false;
  var userPost = new List<UserPostResponse>();
  UserPostPresenter _postPresenter;

  @override
  void initState() {
    _postPresenter = new UserPostPresenter(this);
    _postPresenter.getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Post'),
      ),
      body: Stack(
        children: [
          _userPostBody(context),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
        ],
      ),
    );
  }

  _userPostBody(BuildContext context) {
    return ListView.builder(
        itemCount: userPost.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return listItem(userPost[index]);
        });
  }

  listItem(UserPostResponse userPost) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Text('${userPost.title}'),
    );
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

  @override
  void showUserPostResponse(List<UserPostResponse> res) {
    if (res.length < 1) {
      print('Post not available');
    } else {
      setState(() {
        userPost = res;
      });
    }
  }
}
