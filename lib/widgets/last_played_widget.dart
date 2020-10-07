import 'package:flutter/material.dart';
import 'package:google_stadia/models/last_played_game.dart';
import 'package:google_stadia/utils/text_styles.dart';
import 'package:google_stadia/widgets/game_progress_widget.dart';

class LastPlayedWidget extends StatelessWidget {
  final LastPlayedGame lastPlayedGame;
  final double progress;
  final double width;

  const LastPlayedWidget(
      {Key key, this.lastPlayedGame, this.progress, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          child: Image.asset(
                            lastPlayedGame.imgPath,
                            width: 45.0,
                            height: 60.0,
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
                        text: TextSpan(children: [
                          TextSpan(
                              text: lastPlayedGame.name, style: headingTwo),
                          TextSpan(text: "\n"),
                          TextSpan(
                              text: "${lastPlayedGame.hoursPlayed} hours",
                              style: bodyText)
                        ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GameProgressWidget(
              progress: progress,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}
