import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/admin/create_user/cubit/cubit.dart';
import 'package:ks_smart/src/model/user_model.dart';
import 'package:ks_smart/src/services/firebase/create_user.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(InitialState());

  void createUser({
    required String userName,
    required String password,
    required String dob,
    required context,
  }) async{
    final response = await Firebase().addUser(
      UserModel().toJson(
        UserModel(userName: userName, password: password, dob: dob),
      ),
      userName
    );
    if (response == 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Created User Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }
}
