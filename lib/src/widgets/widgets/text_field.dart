import 'package:flutter/material.dart';
import 'package:ks_smart/src/config/light_theme.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.label, this.controller,this.validator,this.enabled})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String label;
  final TextEditingController? controller;
  final bool? enabled;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 75,
      width: size.width * 0.9,
      child: Form(
        key: _formKey,
        child: TextFormField(
          enabled: enabled ?? true,
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 15,
            ),
            enabled: true,
            alignLabelWithHint: true,
            hintText: label,
            hintStyle: TextStyle(color: LightTheme.secondary),
            fillColor: LightTheme.theme,
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
          validator: validator,
          
          onChanged: (value) => _formKey.currentState!.validate(),
        ),
      ),
    );
  }
}
