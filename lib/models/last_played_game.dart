import 'package:google_stadia/utils/assets_paths.dart';

class LastPlayedGame {
  final String name;
  final int hoursPlayed;
  final String imgPath;
  final double gameProgress;

  LastPlayedGame({this.name, this.hoursPlayed, this.imgPath, this.gameProgress});
}

final lastPlayedGames = [
  LastPlayedGame(name: "God Of War 4", hoursPlayed: 10, gameProgress: 0.23, imgPath: gow),
  LastPlayedGame(name: "Assassins Creed Vahalla", hoursPlayed: 1, gameProgress: 0.15, imgPath: acv),
  LastPlayedGame(name: "Assassins Creed Odyssey", hoursPlayed: 4, gameProgress: 0.10, imgPath: aco),
  LastPlayedGame(name: "Assassins Creed Revelations", hoursPlayed: 14, gameProgress: 0.50, imgPath: acr),
];