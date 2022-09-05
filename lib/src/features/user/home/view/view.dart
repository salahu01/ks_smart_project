import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/utils/constants.dart';

import '../../../../config/light_theme.dart';
import '../../../../widgets/widgets.dart';
import '../cubit/cubit.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({Key? key}) : super(key: key);

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
                UserRadioOptions.myBio,
                'My Bio',
                context,
              ),
              selectOption(
                UserRadioOptions.myProject,
                'My Project',
                context,
              ),
              const SizedBox(height: 30),
              button(
                text: 'Submit',
                onTap: () => context.read<UserHomeCubit>().submitAction(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectOption(UserRadioOptions userRadioOptions, String text,
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
              Radio<UserRadioOptions>(
                value: userRadioOptions,
                fillColor: MaterialStateProperty.all(LightTheme.secondary),
                groupValue:
                    context.select((UserHomeCubit state) => state.state),
                onChanged: (UserRadioOptions? value) => context
                    .read<UserHomeCubit>()
                    .changeRadio(value ?? userRadioOptions),
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
