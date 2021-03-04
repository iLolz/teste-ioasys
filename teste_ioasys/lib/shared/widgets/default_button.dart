import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;

  final Function onPressed;

  const DefaultButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  })  : assert(text != null && text != ""),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(text),
      textColor: AppColors.whisper,
      color: AppColors.ruby,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: 48,
      minWidth: 316,
    );
  }
}
