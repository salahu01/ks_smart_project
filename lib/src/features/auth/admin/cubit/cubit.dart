import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ks_smart/src/features/admin/home/home.dart';

class AuthAdminCubit extends Cubit<void> {
  AuthAdminCubit() : super(Void);
  void validate(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email) &&
        password.length >= 6) {
      if (adminLogin(email: email, password: password)) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AdminHomeView()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Enter Existing Admin Details !')));
      }
    }
  }

  bool storeData() {
    return true;
  }

  bool adminLogin({required String email, required String password}) {
    if (email == 'Admin@kssmart.co' && password == '123456') {
      return true;
    }
    return false;
  }
}
