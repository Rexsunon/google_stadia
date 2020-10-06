import 'package:flutter/material.dart';
import 'package:google_stadia/utils/colors.dart';

class GameProgressWidget extends StatefulWidget {
  final double progress;
  final double width;

  const GameProgressWidget({Key key, this.progress, this.width}) : super(key: key);

  @override
  _GameProgressWidgetState createState() => _GameProgressWidgetState();
}

class _GameProgressWidgetState extends State<GameProgressWidget> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progressAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    progressAnimation = Tween<double>(begin: 0, end: widget.width * 0.33 * widget.progress).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barWidth = widget.width * 0.33;

    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (BuildContext context, Widget widget) {
        return Stack(
          children: <Widget>[
            Container(
              width: barWidth,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: tertiaryTextColor, width: 1),
              ),
            ),
            Container(
              width: progressAnimation.value,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                gradient: appGradient,
              ),
            ),
          ],
        );
      },
    );
  }
}
