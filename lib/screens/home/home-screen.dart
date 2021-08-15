import 'package:flutter/material.dart';

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
                width: 350,
                margin: EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    Text(
                      "Queremos te ajudar a encontrar um esporte que você possa praticar com prazer.",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Mas se você já tem o seu esporte favorito, nós te ajudamos a encontrar o local adequado para praticá-lo.",
                        style: TextStyle(color: Colors.black, fontSize: 15),
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
                            title: "Me ajuda a escolher, GSport!",
                            isSelected: _choosed == 2,
                            press: () => chooseDecision(2),
                          )
                        ],
                      ),
                    ),
                    ButtonNext(isFilled: _choosed != 0, press: () => goTo())
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
      // got to sport lists or whatever
    }

    if (_choosed == 2) {
      //go to quiz
    }
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
                        color:isSelected ?? false
                        ? Color(0xff466CF9)
                        : Color(0xff757575)))),
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
      onTap: press,
      child: Container(
        width: 350,
        height: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: isFilled ? Color(0xff466CF9) : Color(0xffE5E5E5),
              borderRadius: BorderRadius.circular(7)),
          child: Center(
              child: Text(
            "Prosseguir",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
