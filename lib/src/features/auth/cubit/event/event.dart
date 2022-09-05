import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ks_smart/src/features/admin/home/home.dart';

import '../state/state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(InitialState());
  void validate(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email) &&
        password.length <= 6) {
      log('hey salhu');
      adminLogin(email: email, password: password)
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminHomeView(),
              ),
            )
          : userLogIn(email: email, password: password, context: context);
    }
  }

  void userLogIn(
      {required String email,
      required String password,
      required context}) async {
    emit(LoadingState());
    final response = '';
    if (response.isEmpty) {
      log('Empty');
    } else if (response == 'e') {
      emit(ErrorState());
    } else if (response == 'network error') {
      emit(NetworkErrorState());
    } else {
      emit(SuccessState());
    }
  }

  bool adminLogin({required String email, required String password}) {
    if (email == 'Admin@kssmart.co' && password == '123456') {
      return true;
    }
    return false;
  }

  bool storeData() {
    return true;
  }
}
