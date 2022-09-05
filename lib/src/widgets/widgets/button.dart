import 'package:flutter/material.dart';
import 'package:ks_smart/src/config/light_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.textSize,
    required this.onTap,
    required this.label,
    this.color,
    this.textColor,
  }) : super(key: key);
  final double width;
  final double height;
  final double textSize;
  final VoidCallback onTap;
  final String label;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: ColoredBox(
          color: color ?? LightTheme.secondary,
          child: Center(
              child: Text(
            label,
            style: TextStyle(
              color: textColor ?? LightTheme.primary,
              fontSize: textSize,
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
      ),
    );
  }
}
