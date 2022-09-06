import 'package:flutter/material.dart';
import 'package:ks_smart/src/config/light_theme.dart';
import 'package:ks_smart/src/model/user_model.dart';

import '../../../../widgets/widgets.dart';

class MyBioView extends StatelessWidget {
  const MyBioView({Key? key,required this.userModel}) : super(key: key);
  final UserModel userModel;
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
              const CustomHead(text: 'My Bio'),
              const SizedBox(height: 30),
              CustomTextField(
                enabled: false,
                label: userModel.userName.toString(),
              ),
              CustomTextField(
                enabled: false,
                label: userModel.password.toString(),
              ),
              CustomTextField(
                enabled: false,
                label: userModel.dob.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
