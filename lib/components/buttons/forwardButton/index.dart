import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  final bool isFilled;
  final VoidCallback? press;
  const ForwardButton({Key? key, this.isFilled = false, this.press})
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
              color: isFilled ? Color(0xff466CF9) : Colors.white,
              borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: Icon(
              Icons.arrow_forward,
              color: isFilled ? Colors.white : Colors.grey[300],
            ),
          ),
        ),
      ),
    );
  }
}
