import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key, required this.currentStep, required this.finalStep})
      : super(key: key);

  final int currentStep;
  final int finalStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 32,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(80)),
        child: Center(
            child: Text(
          '$currentStep - $finalStep',
          style: TextStyle(color: Colors.black),
        )),
      ),
    );
  }
}
