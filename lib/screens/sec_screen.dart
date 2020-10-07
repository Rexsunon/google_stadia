import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_stadia/models/last_played_game.dart';
import 'package:google_stadia/utils/assets_paths.dart';
import 'package:google_stadia/utils/colors.dart';
import 'package:google_stadia/utils/text_styles.dart';
import 'package:google_stadia/widgets/content_heading_widget.dart';
import 'package:google_stadia/widgets/continue_game_widget.dart';
import 'package:google_stadia/widgets/popular_with_friends_widget.dart';

class SecScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  spiderman,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Container(color: Colors.black.withOpacity(0.3)),
                Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "NEW GAME", style: newGamesHeader),
                                TextSpan(text: "\n"),
                                TextSpan(
                                    text: "Spiderman: Miles Morales",
                                    style: newGameText),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                              decoration: BoxDecoration(
                                gradient: appGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text("Play", style: newGameText,),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ContentHeadingWidget(text: "Popular With Friends"),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < popularWithFriends.length; i++)
                          PopularWithFriendsWidget(image: popularWithFriends[i])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ContentHeadingWidget(text: "Continue Playing"),
                ),
                Expanded(
                  child: ContinueGameWidget(lastPlayedGame: lastPlayedGames[0]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
