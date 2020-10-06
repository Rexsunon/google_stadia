import 'package:flutter/material.dart';
import 'package:google_stadia/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Stadia Moble',
      theme: ThemeData(canvasColor: Colors.white, primaryColor: Colors.blue, fontFamily: 'Oxygen'),
      home: HomeScreen(),
    );
  }
}
