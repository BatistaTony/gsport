import 'package:flutter/material.dart';
import 'package:gsport/screens/home/home-screen.dart';
import 'package:gsport/screens/quiz/index.dart';
import 'package:gsport/screens/quiz/steps/index.dart';

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
      initialRoute: 'home',
      routes: {
        "home": (context) => HomeScreen(),
        "quiz": (context) => WelcomeQuiz(),
        "quizSteps": (context) => QuizSteps(),
        // "/show_sport": (context) => (),
        // "/quiz": (context) => (),
        // "/choose_sport": (context) => (),
      },
    );
  }
}
