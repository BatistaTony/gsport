import 'package:flutter/material.dart';
import 'package:gsport/screens/components/button-next.dart';
import 'package:gsport/screens/components/button-quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _choosed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GSport App"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            margin: EdgeInsets.only(top: 76, bottom: 20),
            child: Column(children: <Widget>[
              Image.asset("assets/images/illustration.png"),
              Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    Text(
                      "Queremos te ajudar a encontrar um esporte que você possa praticar com prazer.",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Mas se você já tem o seu esporte favorito, nós te ajudamos a encontrar o local adequado para praticá-lo.",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: <Widget>[
                          ButtonQuiz(
                            title: "Já tenho um esporte favorito!",
                            isSelected: _choosed == 1,
                            press: () => chooseDecision(1),
                          ),
                          ButtonQuiz(
                            title: "Me ajude a escolher, GSport!",
                            isSelected: _choosed == 2,
                            press: () => chooseDecision(2),
                          )
                        ],
                      ),
                    ),
                    ButtonNext(
                        title: "Prosseguir",
                        isFilled: _choosed != 0,
                        press: () => goTo())
                  ],
                ),
              )
            ]),
          )),
        ));
  }

  void chooseDecision(int decision) {
    setState(() {
      _choosed = decision;
    });
  }

  void goTo() {
    if (_choosed == 1) {
      Navigator.pushNamed(context, '/show_sport');
      print(_choosed);
    }

    if (_choosed == 2) {
      Navigator.pushNamed(context, '/quiz');
    }
  }
}
