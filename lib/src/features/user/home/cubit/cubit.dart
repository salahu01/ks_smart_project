import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/user/my_bio/my_bio.dart';
import 'package:ks_smart/src/features/user/my_project/my_project.dart';
import 'package:ks_smart/src/model/user_model.dart';

import '../../../../utils/constants.dart';
import '../../../auth/home/home.dart';

class UserHomeCubit extends Cubit<UserRadioOptions> {
  UserHomeCubit() : super(UserRadioOptions.initialState);
  void changeRadio(UserRadioOptions value) => emit(value);

  void submitAction(BuildContext context, UserModel userModel) {
    if (state == UserRadioOptions.myBio) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyBioView(userModel: userModel),
        ),
      );
    } else if (state == UserRadioOptions.myProject) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MyProjectView(userName: userModel.userName ?? ''),
        ),
      );
    } else if (state == UserRadioOptions.logOut) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthHomeView()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Select Any Options')));
    }
  }
}
