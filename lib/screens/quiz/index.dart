import 'package:flutter/material.dart';

class WelcomeQuiz extends StatefulWidget {
  const WelcomeQuiz({Key? key}) : super(key: key);

  @override
  _WelcomeQuizState createState() => _WelcomeQuizState();
}

class _WelcomeQuizState extends State<WelcomeQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GSport App"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 76, right: 15, left: 15),
        child: Column(children: <Widget>[
          Container(child: Image.asset("assets/images/illustration.png")),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                    "Nós vamos te fazer algumas perguntas para entender melhor qual é o seu perfil e encontrar o melhor esporte para você praticar.",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    textAlign: TextAlign.justify),
              ),
              Container(
                  margin: EdgeInsets.only(top: 300),
                  child: ButtonNext(isFilled: true))
            ],
          )
        ]),
      ),
    );
  }
}

class ButtonQuiz extends StatelessWidget {
  final bool? isSelected;
  final VoidCallback? press;
  final String title;
  const ButtonQuiz(
      {Key? key, this.isSelected = false, this.press, this.title = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 350,
        height: 70,
        margin: EdgeInsets.only(bottom: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: isSelected ?? false
                      ? Color(0xff466CF9)
                      : Color(0xff757575)),
              borderRadius: BorderRadius.circular(7),
              color: isSelected ?? false
                  ? Color.fromRGBO(70, 108, 249, 0.15)
                  : Colors.transparent),
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      color: isSelected ?? false
                          ? Color(0xff466CF9)
                          : Color(0xff757575)))),
        ),
      ),
    );
  }
}

class ButtonNext extends StatelessWidget {
  final bool isFilled;
  final VoidCallback? press;
  const ButtonNext({Key? key, this.isFilled = false, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/quizSteps',
        );
      },
      child: Container(
        width: 350,
        height: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Color(0xff466CF9), borderRadius: BorderRadius.circular(7)),
          child: Center(
              child: Text(
            "Iniciar",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
