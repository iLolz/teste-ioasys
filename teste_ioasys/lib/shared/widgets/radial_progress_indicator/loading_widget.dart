import 'package:flutter/material.dart';

import 'animated_radial_progress.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
          child: AppAnimatedRadialProgress(
            size: 55,
            animationConstant: 2,
          ),
        ),
      ),
      Center(
        child: Container(
          child: AppAnimatedRadialProgress(
            size: 85,
            animationConstant: -2,
          ),
        ),
      ),
    ]);
  }
}
