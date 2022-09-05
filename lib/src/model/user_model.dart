import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userName;
  String? password;
  String? dob;

  UserModel({this.userName, this.password, this.dob});

  UserModel.fromResponse(DocumentSnapshot<Object?> response) {
    userName = response.get('name');
    password = response.get('password');
    dob = response.get('dob');
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
