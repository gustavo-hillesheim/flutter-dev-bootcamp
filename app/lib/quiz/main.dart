import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dev_bootcamp/quiz/quiz-page.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}
