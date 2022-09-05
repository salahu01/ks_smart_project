import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/admin/create_project/view/view.dart';
import 'package:ks_smart/src/features/admin/create_user/create_user.dart';

import '../../../../utils/constants.dart';

class AdminHomeCubit extends Cubit<AdminRadioOptions> {
  AdminHomeCubit() : super(AdminRadioOptions.initialState);
  void changeRadio(AdminRadioOptions value) => emit(value);

  void submitAction(BuildContext context) {
    if (state == AdminRadioOptions.createUser) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateUserView(),
        ),
      );
    } else if (state == AdminRadioOptions.createProject) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateProjectView(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Select Any Options')));
    }
  }
}
