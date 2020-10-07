import 'package:flutter/material.dart';
import 'package:google_stadia/models/last_played_game.dart';
import 'package:google_stadia/utils/colors.dart';
import 'package:google_stadia/utils/text_styles.dart';

class ContinueGameWidget extends StatelessWidget {
  final LastPlayedGame lastPlayedGame;

  const ContinueGameWidget({Key key, @required this.lastPlayedGame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(
          top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          gradient: appGradient,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Image.asset(
                    lastPlayedGame.imgPath,
                    width: 80.0,
                    height: screenHeight * .13,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 8.0,
                  right: 8.0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: lastPlayedGame.name, style: newGameText),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: "${lastPlayedGame.hoursPlayed} hours",
                      style: bodyText.copyWith(
                          color: Colors.white,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
