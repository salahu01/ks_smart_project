import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ks_smart/src/model/project_model.dart';
import 'package:ks_smart/src/model/user_model.dart';
import 'package:ks_smart/src/services/exception/firebase.dart';

class Firebase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference projects =
      FirebaseFirestore.instance.collection('projects');

  Future<String> addUser(Map<String, dynamic> json, String name) async {
    try {
      final response = await users.doc(name).get();
      if (response.data() == null) {
        await users.doc(name).set(json);
        return 'Success';
      } else {
        return 'User Already Exist !';
      }
    } on FirebaseException catch (e) {
      return FirebaseExceptionHandler().eHandler(e);
    } on SocketException {
      return 'Connection Refused !';
    }
  }

  Future<String> addProject(
      Map<String, dynamic> json, String name, String projectName) async {
    try {
      final response = await projects
          .doc(name)
          .collection('projects')
          .doc(projectName)
          .get();
      if (response.data() == null) {
        await projects
            .doc(name)
            .collection('projects')
            .doc(projectName)
            .set(json);
        return 'Success';
      } else {
        return 'Project Already Exist !';
      }
    } on FirebaseException catch (e) {
      return FirebaseExceptionHandler().eHandler(e);
    } on SocketException {
      return 'Connection Refused !';
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
    } on SocketException {
      return 'Connection Refused !';
    }
  }

  Future<dynamic> fetchMyProjetcs(String userName) async {
    try {
      final res = await projects.doc(userName).collection('projects').get();
      return res.docs.map((e) => ProjectModel.fromJson(e.data())).toList();
    } on FirebaseException {
      return 'firebase error';
    } on SocketException {
      return 'Connection Refused !';
    }
  }

  Future<dynamic> fetchUsers() async {
    try {
      final res = await users.get();
      return res.docs.map((e) => e.id).toList();
    } on FirebaseException {
      return 'firebase error';
    } on SocketException {
      return 'Connection Refused !';
    }
  }
}
