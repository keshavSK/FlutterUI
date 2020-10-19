class UserSignUpResponse {
  int status;
  String message;
  int user;

  UserSignUpResponse({this.status, this.message, this.user});

  UserSignUpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['Message'];
    user = json['User'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Message'] = this.message;
    data['User'] = this.user;
    return data;
  }
}