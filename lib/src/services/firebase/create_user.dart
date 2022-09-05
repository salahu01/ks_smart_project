import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ks_smart/src/model/user_model.dart';
import 'package:ks_smart/src/services/exception/firebase.dart';

class Firebase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<String> addUser(Map<String, dynamic> json, String name) async {
    try {
      await users.doc(name).set(json);
      return 'Success';
    } on FirebaseException catch (e) {
      return FirebaseExceptionHandler().eHandler(e);
    }
  }

  Future<String> checkUser(UserModel userModel, String name) async {
    try {
      final response = await users.doc(name).get();
      if (response.data() != null) {
        final UserModel jsonUserModel = UserModel.fromResponse(response);
        return userModel.password != jsonUserModel.password
            ? 'Enter Valid User Password !'
            : userModel.dob != jsonUserModel.dob
                ? 'Enter Valid User DateOfBirth !'
                : 'Success';
      } else {
        return 'Enter Valid User Name !';
      }
    } on FirebaseException catch (e) {
      return FirebaseExceptionHandler().eHandler(e);
    }
  }
}
