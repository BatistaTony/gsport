import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final bool isFilled;
  final VoidCallback? press;
  const BackButton({Key? key, this.isFilled = false, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 48,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                  color: isFilled ? Color(0xff466CF9) : Colors.grey.shade400),
              color: Colors.white,
              borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: isFilled ? Color(0xff466CF9) : Colors.grey[300],
            ),
          ),
        ),
      ),
    );
  }
}
