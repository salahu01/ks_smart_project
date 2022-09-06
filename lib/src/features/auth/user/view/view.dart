import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/widgets/widgets.dart';
import 'package:ks_smart/src/config/light_theme.dart';

import '../user.dart';

class AuthUserView extends StatelessWidget {
  AuthUserView({Key? key}) : super(key: key);
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController dob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: LightTheme.primary,
            appBar: const CustomAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomHead(text: 'User Login'),
                  const SizedBox(height: 30),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        right: 20,
                      ),
                      child: CustomButton(
                        height: 60,
                        width: 180,
                        textSize: 26,
                        onTap: () => context.read<AuthUserCubit>().validate(
                            userName: userName.text,
                            password: password.text,
                            dob: dob.text,
                            context: context),
                        label: 'LogIn',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Builder(
            builder: (context) {
              return Visibility(
                visible: context.select((AuthUserCubit state) => state.state),
                child: Scaffold(
                  backgroundColor: Colors.black26,
                  body: Center(
                    child: CircularProgressIndicator(
                      color: LightTheme.primary,
                      strokeWidth: 10,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
