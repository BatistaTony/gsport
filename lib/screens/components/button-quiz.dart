import 'package:flutter/material.dart';

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
        ));
  }
}
