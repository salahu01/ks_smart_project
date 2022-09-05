import 'package:flutter/material.dart';
import 'package:ks_smart/src/config/light_theme.dart';

class CustomHead extends StatelessWidget {
  const CustomHead({Key? key,required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: LightTheme.secondary,
      fontSize: 30,
      fontWeight: FontWeight.w900,
    ),);
  }
}