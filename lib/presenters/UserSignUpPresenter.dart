import 'dart:convert';

import 'package:flutter_ui_component/repositories/RestAdapterRepository.dart';
import 'package:flutter_ui_component/responses/UserSignUpResponse.dart';
import 'package:flutter_ui_component/views/MVPView.dart';
import 'package:http/http.dart';

abstract class UserSignUpView extends MVPView {
  void showSignUpResponse(UserSignUpResponse response);
}

abstract class UserSignUpOps {
  void signUp(
    String name,
    String email,
    String mobile,
    String address,
    String password,
    String country,
    String state,
    String city,
  );

  void onDataReceived(UserSignUpResponse response);
}

class UserSignUpPresenter implements UserSignUpOps {
  UserSignUpView _userSignUpView;
  RestAdapterRepository _adapterRepository;

  UserSignUpPresenter(this._userSignUpView) {
    _adapterRepository = new RestAdapterRepository();
  }

  @override
  void onDataReceived(UserSignUpResponse response) {
    _userSignUpView.hideLoading();
    _userSignUpView.showSignUpResponse(response);
  }

  @override
  void signUp(String name, String email, String mobile, String address,
      String password, String country, String state, String city) {
    _userSignUpView.showLoading();
    var paramsMaps = {
      'name': name,
      'mobile': email,
      'email': mobile,
      'address': address,
      'password': password,
      'country_id': country,
      'state_id': state,
      'city_id': city,
    };
    _adapterRepository.executePOST('api/users/sign_up', paramsMaps).then((res) {
      Response response = res;
      if (response.statusCode == 200) {
        UserSignUpResponse signUpResponse =
            UserSignUpResponse.fromJson(json.decode(response.body));
        onDataReceived(signUpResponse);
      } else {
        _userSignUpView.hideLoading();
        _userSignUpView.showError('Failed to register');
      }
    }).catchError((onError) {
      _userSignUpView.hideLoading();
      _userSignUpView.showError('Failed to register');
    });
  }
}
