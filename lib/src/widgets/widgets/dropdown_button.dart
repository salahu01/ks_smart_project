import 'package:flutter/material.dart';
import 'package:ks_smart/src/config/light_theme.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {Key? key,
      required this.listModel,
      required this.onChanged,
      required this.label})
      : super(key: key);
  final List<String?> listModel;
  final String label;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ColoredBox(
      color: LightTheme.theme,
      child: SizedBox(
        height: 50, 
        width: size.width * 0.9,
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Padding(
                padding: const EdgeInsets.only(left:10),
                child: Text(
                  label,
                  style: TextStyle(color: LightTheme.secondary),
                ),
              ),
              elevation: 0,
              icon: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 0),
                child: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: LightTheme.secondary,
                  size: 35,
                ),
              ),
              isDense: true,
              isExpanded: true,
              items: listModel.map((String? items) {
                return DropdownMenuItem(
                  value: items,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      items.toString(),
                      style: TextStyle(
                        color: LightTheme.secondary,
                      ),
                    ),
                  ),
                ); 
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
