import 'package:flutter/material.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';
import 'package:vector_math/vector_math_64.dart' as math;

///Radial progress indicator with gradiente
class RadialProgress extends StatefulWidget {
  ///Cirular percentage to complete with animation
  final double goalCompleted = 1.0;
  final double size;

  const RadialProgress({Key key, this.size = 55.0}) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fillDuration = Duration(milliseconds: 900);

  double progressDegrees = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);

    _progressAnimation = Tween(begin: 130.0, end: 360.0).animate(
        CurvedAnimation(
            reverseCurve: Curves.easeOut,
            parent: _radialProgressAnimationController,
            curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
          if (_progressAnimation.isCompleted) {
            _radialProgressAnimationController
                .reverse()
                .then((value) => _radialProgressAnimationController.forward());
          }
        });
      });

    _radialProgressAnimationController.forward();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: widget.size,
        width: widget.size,
        child: Column(
          children: <Widget>[],
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

///
class RadialPainter extends CustomPainter {
  ///
  double progressInDegrees;

  ///
  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    ///
    final paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    final progressPaint = Paint()
      ..shader = LinearGradient(
              colors: [AppColors.grey40, Colors.transparent],
              tileMode: TileMode.clamp)
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
