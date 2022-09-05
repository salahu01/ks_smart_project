import 'package:flutter/material.dart';
import 'package:ks_smart/src/config/light_theme.dart';
import 'package:ks_smart/src/widgets/widgets/appbar.dart';

class MyBioView extends StatelessWidget {
  const MyBioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: const CustomAppBar()
      ),
    );
  }
}
