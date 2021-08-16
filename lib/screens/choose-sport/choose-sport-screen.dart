import 'package:flutter/material.dart';
import 'package:gsport/models/sport.dart';
import 'package:gsport/screens/choose-sport/questions.dart';
import 'package:gsport/screens/components/button-next.dart';

class ChooseSportScreen extends StatelessWidget {
  const ChooseSportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escolha um esporte")),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Container(
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Esses são os esportes que mais se adéquam ao seu perfil!",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Qual deles você quer praticar?",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textAlign: TextAlign.left,
                        )),
                    SportSlider(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonSlider extends StatelessWidget {
  final String? icon;
  final VoidCallback? press;
  const ButtonSlider({Key? key, this.icon = "", this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color.fromRGBO(70, 108, 249, 0.15),
              borderRadius: BorderRadius.circular(100)),
          child: Image.asset(icon ?? "")),
    );
  }
}

class SportSlider extends StatefulWidget {
  const SportSlider({Key? key}) : super(key: key);

  @override
  _SportSliderState createState() => _SportSliderState();
}

class _SportSliderState extends State<SportSlider> {
  int _index = 0;
  int _totalSports = sports.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 75),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ButtonSlider(
                          icon: "assets/icons/back.png", press: () => back()),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          child: Image.asset(
                        sports[_index].image ?? "",
                        width: 250,
                        height: 250,
                      )),
                    ],
                  ),
                  Column(
                    children: [
                      ButtonSlider(
                          icon: "assets/icons/next.png", press: () => next()),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Column(
                children: [
                  Text(
                    sports[_index].name ?? "",
                    style: TextStyle(fontSize: 24),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        child: Row(
                          children: sports.map((sport) {
                            var sliderIndex = sports.indexOf(sport);
                            return SliderDot(isSelected: sliderIndex == _index);
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 140),
          alignment: Alignment.bottomCenter,
          child: ButtonNext(
            title: "Vamos praticar?",
            press: () => goPractice(),
            isFilled: true,
          ),
        )
      ],
    );
  }

  void goPractice() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Questions(sportId: _index),
      ),
    );
  }

  void next() {
    setState(() {
      if (_index < _totalSports - 1) {
        _index = _index + 1;
      }
    });
  }

  void back() {
    setState(() {
      if (_index <= 1 || _index == 0) {
        _index = 0;
      } else {
        _index = _index - 1;
      }
    });
  }
}

class SliderDot extends StatelessWidget {
  final bool? isSelected;
  const SliderDot({Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 8, top: 16),
        padding: EdgeInsets.all(2.5),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ?? false ? Color(0xff466CF9) : Color(0xffE5E5E5),
        ));
  }
}
