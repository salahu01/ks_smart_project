class UserModel {
  String? userName;
  String? password;
  String? dob;

  UserModel({this.userName, this.password, this.dob});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['name'];
    password = json['password'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    final data = <String, dynamic>{
      "name": userModel.userName,
      "password": userModel.password,
      "dob": userModel.dob
    };
    return data;
  }
}
