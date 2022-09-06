import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ks_smart/src/features/user/home/home.dart';
import 'package:ks_smart/src/model/user_model.dart';
import 'package:ks_smart/src/services/firebase/firebase.dart';

class AuthUserCubit extends Cubit<bool> {
  AuthUserCubit() : super(false);
  void loadingScreen(bool value) => emit(value);
  void validate(
      {required String userName,
      required String password,
      required String dob,
      required BuildContext context}) {
    if (userName.length < 4 || password.length < 6 || dob.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter Existing User Details !')));
    } else {
      userLogIn(
          userName: userName, password: password, dob: dob, context: context);
    }
  }

  void userLogIn(
      {required String userName,
      required String password,
      required String dob,
      required context}) async {
    loadingScreen(true);
    UserModel userModel =
        UserModel(dob: dob, userName: userName, password: password);
    final response = await Firebase().checkUser(userModel, userName);
    if (response == 'Success') {
      loadingScreen(false);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => UserHomeView(
                    userModel: userModel,
                  )),
          (route) => false);
    } else {
      loadingScreen(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }

}
