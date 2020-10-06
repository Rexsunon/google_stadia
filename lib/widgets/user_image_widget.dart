import 'package:flutter/material.dart';
import 'package:google_stadia/utils/colors.dart';
import 'package:google_stadia/utils/text_styles.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class UserImageWidget extends StatelessWidget {
  final bool isOnline;
  final bool showRank;
  final int rank;
  final image;
  final String name;
  final double imageSize = 80.0;

  const UserImageWidget({
    Key key,
    this.isOnline = false,
    this.showRank = false,
    this.rank,
    @required this.image,
    this.name = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: imageSize + 8,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: _UserImageBorder(isOnline: isOnline),
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  child: ClipOval(
                      child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              if (showRank)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: ClipOval(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(gradient: appGradient),
                      child: Center(
                        child: Text(
                          '$rank',
                          style: rankTextStyle,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        if (name != null)
          Text(
            name,
            style: bodyText,
          )
      ],
    );
  }
}

class _UserImageBorder extends CustomPainter {
  final bool isOnline;

  _UserImageBorder({this.isOnline});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (isOnline) {
      borderPaint.shader = appGradient.createShader(
          Rect.fromCircle(center: center, radius: size.width / 2));
    } else {
      borderPaint.color = tertiaryTextColor;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(360), false, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
