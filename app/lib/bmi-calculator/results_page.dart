import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/MainButton.dart';
import 'package:flutter_dev_bootcamp/bmi-calculator/app_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this
      .interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BML CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: AppCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(bmiResult,
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          MainButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            label: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
