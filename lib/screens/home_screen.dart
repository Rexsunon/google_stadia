import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_stadia/models/friends.dart';
import 'package:google_stadia/models/last_played_game.dart';
import 'package:google_stadia/screens/sec_screen.dart';
import 'package:google_stadia/utils/assets_paths.dart';
import 'package:google_stadia/utils/colors.dart';
import 'package:google_stadia/utils/text_styles.dart';
import 'package:google_stadia/widgets/content_heading_widget.dart';
import 'package:google_stadia/widgets/last_played_widget.dart';
import 'package:google_stadia/widgets/user_image_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 10),
            child: Transform.rotate(
              angle: -0.1,
              child: SvgPicture.asset(
                logo,
                height: screenHeight * 0.4,
                color: logoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: primaryTextColor,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecScreen()));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: primaryTextColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            UserImageWidget(
                              image: player1,
                              isOnline: true,
                              rank: 30,
                              showRank: true,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Hello", style: usernameTextStyle),
                                  TextSpan(text: "\n"),
                                  TextSpan(
                                      text: "Rexsunon",
                                      style: usernameTextStyle),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, top: 16.0, bottom: 16.0),
                        child: Material(
                            elevation: 4.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 16.0,
                                  left: 16.0,
                                  right: 16.0,
                                  bottom: 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          "HOURS PLAYED",
                                          style: hoursPlayedLabelTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "124 Hours",
                                    style: hoursPlayedText,
                                  ),
                                ],
                              ),
                            )),
                      ),
                      ContentHeadingWidget(
                        text: "Last Played Games",
                      ),
                      for (int i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedWidget(
                          lastPlayedGame: lastPlayedGames[i],
                          width: screenWidth,
                          progress: lastPlayedGames[i].gameProgress,
                        ),
                      ContentHeadingWidget(
                        text: "Friends",
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        for (int i = 0; i < friends.length; i++)
                          UserImageWidget(
                            isOnline: friends[i].isOnline,
                            image: friends[i].imgPath,
                            name: friends[i].name,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
