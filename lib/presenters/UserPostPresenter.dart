import 'dart:convert';

import 'package:flutter_ui_component/repositories/RestAdapterRepository.dart';
import 'package:flutter_ui_component/responses/UserPostResponse.dart';
import 'package:flutter_ui_component/views/MVPView.dart';
import 'package:http/http.dart';

abstract class GetUserPostView extends MVPView {
  void showUserPostResponse(List<UserPostResponse> userPost);
}

abstract class GetUserOps {
  void getPost();

  void onDataReceived(List<UserPostResponse> userPost);
}

class UserPostPresenter extends GetUserOps {
  GetUserPostView _userPostView;
  RestAdapterRepository adapterRepository;

  UserPostPresenter(this._userPostView) {
    adapterRepository = new RestAdapterRepository();
  }

  @override
  void getPost() {
    _userPostView.showLoading();
    var paramsMaps ;
    adapterRepository.executeGET('posts', paramsMaps).then((res) {
      Response response = res;
      if (response.statusCode == 200) {
        List userPost = jsonDecode(response.body);
        List<UserPostResponse> post =
            userPost.map((e) => new UserPostResponse.fromJson(e)).toList();
        onDataReceived(post);
      } else {
        _userPostView.hideLoading();
        _userPostView.showError('Failed to user post');
      }
    }).catchError((onError) {
      _userPostView.hideLoading();
      _userPostView.showError('Failed to user post');
    });
  }

  @override
  void onDataReceived(List<UserPostResponse> response) {
    _userPostView.hideLoading();
    _userPostView.showUserPostResponse(response);
  }
}
