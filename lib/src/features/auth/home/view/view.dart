import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/config/light_theme.dart';
import 'package:ks_smart/src/features/auth/home/home.dart';
import 'package:ks_smart/src/utils/constants.dart';

import '../../../../widgets/widgets.dart';

class AuthHomeView extends StatelessWidget {
  const AuthHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomHead(text: 'Login'),
                const SizedBox(height: 30),
                selectOption(
                  LoginOptions.admin,
                  'Admin Login',
                  context,
                ),
                selectOption(
                  LoginOptions.user,
                  'User Login',
                  context,
                ),
                const SizedBox(height: 30),
                button(
                  text: 'Submit',
                  onTap: () =>
                      context.read<AuthHomeCubit>().submitAction(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectOption(
          LoginOptions loginOptions, String text, BuildContext context) =>
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 20,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<LoginOptions>(
                value: loginOptions,
                fillColor: MaterialStateProperty.all(LightTheme.secondary),
                groupValue:
                    context.select((AuthHomeCubit state) => state.state),
                onChanged: (LoginOptions? value) => context
                    .read<AuthHomeCubit>()
                    .changeRadio(value ?? loginOptions),
              ),
              button(
                text: text,
                color1: LightTheme.theme,
                color2: LightTheme.secondary,
              ),
            ],
          ),
        ),
      );

  Widget button(
          {required String text,
          Color? color1,
          Color? color2,
          VoidCallback? onTap}) =>
      CustomButton(
        height: 60,
        width: 180,
        textSize: 18,
        color: color1,
        textColor: color2,
        onTap: onTap ?? () {},
        label: text,
      );
}
