import 'dart:convert';

import 'package:flutter_ui_component/repositories/RestAdapterRepository.dart';
import 'package:flutter_ui_component/responses/UserListResponse.dart';
import 'package:flutter_ui_component/views/MVPView.dart';
import 'package:http/http.dart';

abstract class UserListView extends MVPView {
  void showUserListResponse(UserListResponse response);
}

abstract class UserListOps {
  void getUserList();

  void onDataReceived(UserListResponse response);
}

class UserListPresenter implements UserListOps {
  UserListView _userListView;
  RestAdapterRepository _adapterRepository;

  UserListPresenter(this._userListView) {
    _adapterRepository = new RestAdapterRepository();
  }

  @override
  void getUserList() {
    _userListView.showLoading();
    Map<String, dynamic> paramsMaps;
    Response response;
    _adapterRepository
        .executeGET('api/users/get_userss', paramsMaps)
        .then((res) {
      response = res;
      if (response.statusCode == 200) {
        UserListResponse userListResponse =
            UserListResponse.fromJson(json.decode(response.body));
        onDataReceived(userListResponse);
      } else {
        _userListView.hideLoading();
        _userListView.showError(response.body);
      }
    }).catchError((onError) {
      _userListView.hideLoading();
      _userListView.showError(onError.toString());
    });
  }

  @override
  void onDataReceived(UserListResponse response) {
    _userListView.hideLoading();
    _userListView.showUserListResponse(response);
  }
}
