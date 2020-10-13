class UserListResponse {
  int status;
  String message;
  List<User> user;

  UserListResponse({this.status, this.message, this.user});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['Message'];
    if (json['User'] != null) {
      user = new List<User>();
      json['User'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Message'] = this.message;
    if (this.user != null) {
      data['User'] = this.user.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String userId;
  String name;
  String mobileNumber;
  String email;
  String address;
  String password;
  String countryId;
  String stateId;
  String cityId;
  String countryName;
  String stateName;
  String cityName;

  User(
      {this.userId,
        this.name,
        this.mobileNumber,
        this.email,
        this.address,
        this.password,
        this.countryId,
        this.stateId,
        this.cityId,
        this.countryName,
        this.stateName,
        this.cityName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    name = json['Name'];
    mobileNumber = json['MobileNumber'];
    email = json['Email'];
    address = json['Address'];
    password = json['Password'];
    countryId = json['CountryId'];
    stateId = json['StateId'];
    cityId = json['CityId'];
    countryName = json['CountryName'];
    stateName = json['StateName'];
    cityName = json['CityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Name'] = this.name;
    data['MobileNumber'] = this.mobileNumber;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['Password'] = this.password;
    data['CountryId'] = this.countryId;
    data['StateId'] = this.stateId;
    data['CityId'] = this.cityId;
    data['CountryName'] = this.countryName;
    data['StateName'] = this.stateName;
    data['CityName'] = this.cityName;
    return data;
  }
}