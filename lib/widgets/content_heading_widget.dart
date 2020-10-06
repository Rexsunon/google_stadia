import 'package:flutter/material.dart';
import 'package:google_stadia/utils/text_styles.dart';

class ContentHeadingWidget extends StatelessWidget {
  final String text;

  const ContentHeadingWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          text,
          style: headingOne,
        )
    );
  }
}
