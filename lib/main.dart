import 'package:flutter/material.dart';
import 'package:gsport/screens/home/home-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GSport App',
      theme: ThemeData(
        backgroundColor: Color(0xFFFFFF),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomeScreen(),
        // "/show_sport": (context) => (),
        // "/quiz": (context) => (),
        // "/choose_sport": (context) => (),
      },
    );
  }
}
