import 'package:flutter/material.dart';
import 'package:ks_smart/src/widgets/widgets/appbar.dart';

import '../../../../config/light_theme.dart';

class MyProjectView extends StatelessWidget {
  const MyProjectView({Key? key}) : super(key: key);

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
