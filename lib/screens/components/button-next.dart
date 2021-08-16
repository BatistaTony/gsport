import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final String? title;
  final bool isFilled;
  final VoidCallback? press;
  const ButtonNext(
      {Key? key, this.isFilled = false, this.press, this.title = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isFilled ? press : null,
      child: Container(
        height: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: isFilled ? Color(0xff466CF9) : Color(0xffE5E5E5),
              borderRadius: BorderRadius.circular(7)),
          child: Center(
              child: Text(
            title ?? "Prosseguir",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
