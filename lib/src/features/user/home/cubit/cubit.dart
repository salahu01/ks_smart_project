import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/user/my_bio/my_bio.dart';
import 'package:ks_smart/src/features/user/my_project/my_project.dart';

import '../../../../utils/constants.dart';

class UserHomeCubit extends Cubit<UserRadioOptions> {
  UserHomeCubit() : super(UserRadioOptions.initialState);
  void changeRadio(UserRadioOptions value) => emit(value);

  void submitAction(BuildContext context) {
    if (state == UserRadioOptions.myBio) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyBioView(),
        ),
      );
    } else if (state == UserRadioOptions.myProject) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyProjectView(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Select Any Options')));
    }
  }
}