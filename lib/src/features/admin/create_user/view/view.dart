import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/config/light_theme.dart';
import 'package:ks_smart/src/features/admin/create_user/cubit/cubit.dart';
import 'package:ks_smart/src/widgets/widgets/appbar.dart';

import '../../../../widgets/widgets.dart';

class CreateUserView extends StatelessWidget {
  CreateUserView({Key? key}) : super(key: key);
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController dob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: const CustomAppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomHead(text: 'Create User'),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'UserName',
                  controller: userName,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.isNotEmpty) {
                      return text.length < 4
                          ? 'Please enter valid UserName'
                          : null;
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'Password',
                  controller: password,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.isNotEmpty) {
                      return text.length < 6
                          ? 'Please enter valid Password'
                          : null;
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'Date Of Birth : dd/mm/yyyy',
                  controller: dob,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.isNotEmpty) {
                      return text.length != 10
                          ? 'Please enter valid Date Of Birth'
                          : null;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  height: 60,
                  width: 180,
                  textSize: 22,
                  onTap: () => context.read<CreateUserCubit>().createUser(
                        userName: userName.text,
                        password: password.text,
                        dob: dob.text,
                        context: context,
                      ),
                  label: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
