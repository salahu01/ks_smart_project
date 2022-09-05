import 'package:flutter/material.dart';

import '../../config/light_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  final Size preferredSize = const Size(50, 50);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: LightTheme.secondary,
          ),
        ),
      );
}
