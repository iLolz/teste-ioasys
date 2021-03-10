import 'package:flutter/material.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Function validator;
  final bool obscureText;
  final Widget suffixIcon;
  final FocusNode focus;
  final String errorMessage;
  final TextInputAction textInputAction;

  CustomTextFormField({
    Key key,
    this.labelText,
    this.onChanged,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.focus,
    this.errorMessage,
    this.textInputAction,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focus;
  bool hasFocus = false;

  @override
  void initState() {
    focus = widget.focus ?? FocusNode();
    focus.addListener(() {
      hasFocus = focus.hasFocus;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget?.labelText?.isNotEmpty ?? false)
          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: 14,
              color: hasFocus ? AppColors.ruby : AppColors.grey40,
            ),
          ),
        SizedBox(height: 4),
        TextFormField(
          focusNode: focus,
          onChanged: widget.onChanged,
          controller: widget.controller,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          cursorColor: AppColors.ruby,
          decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              fillColor: AppColors.whisper,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: AppColors.flamingo)),
              errorText: widget.errorMessage,
              errorStyle: TextStyle(
                fontFamily: "Rubik",
                fontWeight: FontWeight.w300,
                fontSize: 12,
                inherit: true,
                color: AppColors.flamingo,
              )),
        ),
      ],
    );
  }
}
