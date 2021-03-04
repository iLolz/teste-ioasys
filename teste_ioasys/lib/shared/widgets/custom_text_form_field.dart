import 'package:flutter/material.dart';
import 'package:teste_ioasys/shared/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Function validator;

  const CustomTextFormField({
    Key key,
    @required this.labelText,
    this.onChanged,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.grey40,
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            fillColor: AppColors.whisper,
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
