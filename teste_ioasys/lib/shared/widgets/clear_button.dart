import 'package:flutter/material.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key key,
    this.onClear,
  }) : super(key: key);

  final Function onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 12.0,
        height: 12.0,
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red,
              ),
              child: Icon(
                Icons.clear,
                color: AppColors.whisper,
                size: 20,
              )),
          onTap: onClear,
        ),
      ),
    );
  }
}
