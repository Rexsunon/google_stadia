import '../utils/assets_paths.dart';

class Friend {
  final String name;
  final String imgPath;
  final bool isOnline;

  Friend({this.name, this.imgPath, this.isOnline});
}

final friends = [
  Friend(name: "BuBu", imgPath: player1, isOnline: true),
  Friend(name: "Josh", imgPath: acv, isOnline: true),
  Friend(name: "Allen", imgPath: aco, isOnline: true),
  Friend(name: "Neo", imgPath: aco, isOnline: false),
  Friend(name: "Alex", imgPath: gow, isOnline: false),
  Friend(name: "Dave", imgPath: acr, isOnline: false),
];