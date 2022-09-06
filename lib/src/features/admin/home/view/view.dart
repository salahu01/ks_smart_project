import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/config/light_theme.dart';
import 'package:ks_smart/src/features/admin/home/home.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/widgets.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectOption(
                AdminRadioOptions.createUser,
                'Create User',
                context,
              ),
              selectOption(
                AdminRadioOptions.createProject,
                'Create Project',
                context,
              ),
              selectOption(
                AdminRadioOptions.logOut,
                'Log Out',
                context,
              ),
              const SizedBox(height: 30),
              button(
                text: 'Submit',
                onTap: () => context.read<AdminHomeCubit>().submitAction(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectOption(AdminRadioOptions singingCharacter, String text,
          BuildContext context) =>
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
              Radio<AdminRadioOptions>(
                value: singingCharacter,
                fillColor: MaterialStateProperty.all(LightTheme.secondary),
                groupValue:
                    context.select((AdminHomeCubit state) => state.state),
                onChanged: (AdminRadioOptions? value) => context
                    .read<AdminHomeCubit>()
                    .changeRadio(value ?? AdminRadioOptions.createUser),
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
