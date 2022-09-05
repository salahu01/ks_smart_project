import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/auth/admin/cubit/cubit.dart';
import 'package:ks_smart/src/widgets/widgets.dart';
import 'package:ks_smart/src/config/light_theme.dart';

class AuthAdminView extends StatelessWidget {
  AuthAdminView({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: const CustomAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomHead(text: 'Admin Login'),
              const SizedBox(height: 30),
              CustomTextField(
                label: 'email',
                controller: email,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter some text';
                  } else if (text.isNotEmpty) {
                    return !RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(text)
                        ? 'Please enter valid email'
                        : null;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomTextField(
                label: 'password',
                controller: password,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter some text';
                  } else if (text.isNotEmpty) {
                    return text.length < 6
                        ? 'Please enter valid password'
                        : null;
                  }
                  return null;
                },
              ),
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
                    onTap: () => context.read<AuthAdminCubit>().validate(
                          email: email.text,
                          password: password.text,
                          context: context,
                        ),
                    label: 'LogIn',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
