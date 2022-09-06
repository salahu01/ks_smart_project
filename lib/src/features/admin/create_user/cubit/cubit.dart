import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/model/user_model.dart';
import 'package:ks_smart/src/services/firebase/firebase.dart';

class CreateUserCubit extends Cubit<bool> {
  CreateUserCubit() : super(false);
  void loadingScreen(bool value) => emit(value);

  void validate(
      {required String userName,
      required String password,
      required String dob,
      required BuildContext context}) {
    if (userName.length < 4 || password.length < 6 || dob.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter User Details !')));
    } else {
      createUser(
          userName: userName, password: password, dob: dob, context: context);
    }
  }

  void createUser({
    required String userName,
    required String password,
    required String dob,
    required context,
  }) async{
    loadingScreen(true);
    final response = await Firebase().addUser(
      UserModel().toJson(
        UserModel(userName: userName, password: password, dob: dob),
      ),
      userName
    );
    if (response == 'Success') {
      loadingScreen(false);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Created User Successfully')));
    } else {
      loadingScreen(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }
}
