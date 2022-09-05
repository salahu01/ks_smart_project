import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/auth/admin/view/view.dart';
import 'package:ks_smart/src/features/auth/user/view/view.dart';
import 'package:ks_smart/src/utils/constants.dart';

class AuthHomeCubit extends Cubit<LoginOptions> {
  AuthHomeCubit() : super(LoginOptions.initialState);
  void changeRadio(LoginOptions value) => emit(value);

  void submitAction(BuildContext context) {
    if (state == LoginOptions.admin) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthAdminView(),
        ),
      );
    } else if (state == LoginOptions.user) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthUserView(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Select Any Options')));
    }
  }
}
