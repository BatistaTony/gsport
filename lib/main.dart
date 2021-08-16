import 'package:flutter/material.dart';
import 'package:gsport/screens/choose-sport/choose-sport-screen.dart';
import 'package:gsport/screens/choose-sport/questions.dart';
import 'package:gsport/screens/home/home-screen.dart';
import 'package:gsport/screens/quiz/index.dart';
import 'package:gsport/screens/quiz/steps/index.dart';
import 'package:gsport/screens/show-solutions/solution-screen.dart';

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
        "/": (context) => HomeScreen(),
        "/show_sport": (context) => ChooseSportScreen(),
        '/questions': (context) => Questions(),
        "/solutions": (context) => ShowSolutionScreen(),
        "/quiz": (context) => WelcomeQuiz(),
        "/quizSteps": (context) => QuizSteps(),
        // "/choose_sport": (context) => (),
      },
    );
  }
}
