import 'package:flutter/material.dart';
import 'package:gsport/models/soluttions.dart';
import 'package:gsport/screens/components/button-next.dart';
import 'package:gsport/screens/components/button-quiz.dart';
import 'package:gsport/screens/show-solutions/solution-screen.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key, this.sportId}) : super(key: key);
  final int? sportId;

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int? _choosed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GSport App"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "O que te impede de praticar esportes?",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Image.asset(
                      "assets/images/illustration.png",
                      width: 160,
                      height: 160,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: questions.map((q) {
                          var sliderIndex = questions.indexOf(q);
                          return ButtonQuiz(
                            title: q.title ?? "",
                            isSelected: _choosed == questions[sliderIndex].id,
                            press: () =>
                                chooseQuestions(questions[sliderIndex].id ?? 0),
                          );
                        }).toList(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonNext(
                          title: "Vamos praticar",
                          isFilled: _choosed != null,
                          press: () => goTo()),
                    )
                  ],
                ),
              )
            ]),
          )),
        ));
  }

  void chooseQuestions(int quest) {
    setState(() {
      _choosed = quest;
    });
  }

  void goTo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ShowSolutionScreen(sportId: widget.sportId, questionId: _choosed),
      ),
    );
  }
}
