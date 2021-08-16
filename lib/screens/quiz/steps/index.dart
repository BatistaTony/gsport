import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gsport/components/buttons/backButton/index.dart'
    as ComponentButton;
import 'package:gsport/components/buttons/forwardButton/index.dart';
import 'package:gsport/components/steps/index.dart';
import 'package:gsport/screens/home/home-screen.dart';

class QuizSteps extends StatefulWidget {
  const QuizSteps({Key? key}) : super(key: key);

  @override
  QuizStepsState createState() => QuizStepsState();
}

class QuizStepsState extends State<QuizSteps> with TickerProviderStateMixin {
  final _formsPageViewController = PageController();
  late AnimationController _linearController;

  @override
  void initState() {
    _linearController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 1500),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _linearController.dispose();
    super.dispose();
  }

  late List _forms;

  int _currentStep = 1;
  int _finalStep = 3;

  void _setCurrentStep(int decision) {
    setState(() {
      _currentStep = decision;
    });
  }

  @override
  Widget build(BuildContext context) {
    _linearController.animateTo(_currentStep * 0.34);
    _forms = [
      AgeStep(),
      SportStep(),
      LearnStep(),
      Container(),
    ];

    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 4, top: 24, bottom: 34),
                        child: Steps(
                            currentStep: _currentStep, finalStep: _finalStep)),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Precisamos te conhecer um pouco mais.",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        height: 400,
                        child: PageView.builder(
                          controller: _formsPageViewController,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if (index < 3) return _forms[index];
                            return _forms[index];
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          color: Colors.grey.shade100),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                    "${(_currentStep * 33.33).round()}% completo")),
                                            LinearProgressIndicator(
                                              value: _linearController.value,
                                              semanticsLabel:
                                                  'Linear progress indicator',
                                              color: Colors.blueAccent,
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: ComponentButton.BackButton(
                                    isFilled: _currentStep != 1,
                                    press: _backFormStep,
                                  ),
                                ),
                                ForwardButton(
                                  isFilled: true,
                                  press: _nextFormStep,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _nextFormStep() {
    int currentPage = _formsPageViewController.page!.round();
    if (_currentStep == 3) {
      Navigator.pushNamed(
        context,
        '/quiz',
      );
      return;
    }

    if (currentPage < _forms.length - 2) {
      _formsPageViewController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInCubic,
      );
      if (_currentStep != _finalStep) _setCurrentStep(_currentStep + 1);
      _linearController.animateTo(_currentStep * 0.34);
    }
  }

  void _backFormStep() {
    int currentPage = _formsPageViewController.page!.round();
    if (currentPage != 0) {
      _formsPageViewController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInCubic,
      );
      _setCurrentStep(_currentStep - 1);
      _linearController.animateTo(_currentStep * 0.34);
    }
  }
}

class AgeStep extends StatelessWidget {
  const AgeStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 250),
          child: Text(
            "1 - Qual é a sua idade?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Insira aqui sua idade',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira um valor';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class SportStep extends StatelessWidget {
  const SportStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 250),
          child: Text(
            "2 - Qual é o seu esporte preferido?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Selecione',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira um valor';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class LearnStep extends StatelessWidget {
  const LearnStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 250),
          child: Text(
            "3 - Você sente vontade de aprender algum esporte novo em que não tenha domínio? ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Insira aqui sua resposta',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira um valor';
            }
            return null;
          },
        ),
      ],
    );
  }
}
