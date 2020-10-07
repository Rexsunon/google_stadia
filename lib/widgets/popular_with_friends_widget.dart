import 'package:flutter/material.dart';
import 'package:google_stadia/utils/text_styles.dart';

class PopularWithFriendsWidget extends StatelessWidget {
  final String image;

  const PopularWithFriendsWidget({Key key, @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(image),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            child: MaterialButton(
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              child: Text(
                "Play",
                style: playText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
