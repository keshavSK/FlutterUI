import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_component/responses/CategoryResponse.dart';
import 'package:http/http.dart' as http;

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool isLoading = false;
  var categoryList = List<Categories>();
  var url =
      "http://developerskatta.com/MobileFarmers/api/users/get_categories?user_id=1";

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _callApi();
  }

  _callApi() async {
    var response = await http.get(url);
    if (response.statusCode == 200 && response.body != null) {
      CategoryResponse categoryResponse =
          CategoryResponse.fromJson(json.decode(response.body));
      if (categoryResponse.status == 200) {
        setState(() {
          categoryList = categoryResponse.categories;
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Stack(
        children: [
          _userListBody(context),
          isLoading ? Center(child: CircularProgressIndicator()) : Container()
        ],
      ),
    );
  }

  _userListBody(BuildContext context) {
    return ListView.builder(
        itemCount: categoryList.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _listItem(categoryList[index]);
        });
  }

  _listItem(Categories categories) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.network(
            categories.mediaUrl,
            height: 70.0,
            width: 70.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text('${categories.category}'),
        ],
      ),
    );
  }
}
