import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/quiz/quiz-page-bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatelessWidget {
  final QuizPageBloc bloc = QuizPageBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        children: [
          _questionText,
          _answerButtons(context),
          _scoreboard,
        ],
      ),
    );
  }

  Widget get _questionText => Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: StreamBuilder<QuizQuestion>(
              stream: bloc.questionStream,
              builder: (context, questionSnapshot) {
                if (!questionSnapshot.hasData) {
                  return QuestionText('Loading question...');
                }
                return QuestionText(questionSnapshot.data.question);
              },
            ),
          ),
        ),
      );

  Widget _answerButtons(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 8),
        child: QuizButtonRow(
          onAnswer: (answer) {
            bool isLastQuestion = bloc.isLastQuestion();
            bloc.answerQuestion(answer);
            if (isLastQuestion) {
              this
                  .showFinishedAlert(context)
                  .then((_) => bloc.resetQuestions());
            }
          },
        ),
      );

  Widget get _scoreboard => Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: StreamBuilder<List<QuestionScore>>(
          stream: bloc.scoreStream,
          builder: (context, scoreSnapshot) =>
              QuizScoreboard(scoreSnapshot.data ?? []),
        ),
      );

  Future<void> showFinishedAlert(BuildContext context) => Alert(
        context: context,
        title: 'Finished',
        content: Text(
            'Your score was ${bloc.correctQuestionsNumber}/${bloc.totalQuestionsNumber}'),
        buttons: [
          DialogButton(
            child: Text(
              'Play again',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ).show();
}

class QuestionText extends StatelessWidget {
  final String question;

  const QuestionText(this.question);

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 24),
    );
  }
}

class QuizButtonRow extends StatelessWidget {
  final ValueChanged<bool> onAnswer;

  QuizButtonRow({this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _trueButton,
        ),
        SizedBox(width: 4),
        Expanded(child: _falseButton),
      ],
    );
  }

  Widget get _trueButton => QuizButton(
        color: Colors.green,
        text: 'True',
        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
        onPressed: () => onAnswer(true),
      );

  Widget get _falseButton => QuizButton(
        color: Colors.red,
        text: 'False',
        borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
        onPressed: () => onAnswer(false),
      );
}

class QuizButton extends StatelessWidget {
  final Color color;
  final String text;
  final BorderRadius borderRadius;
  final VoidCallback onPressed;

  const QuizButton({this.color, this.text, this.borderRadius, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        textColor: color,
        highlightedBorderColor: color.withAlpha(100),
        borderSide: BorderSide(color: color, width: 4),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class QuizScoreboard extends StatelessWidget {
  final List<QuestionScore> scores;

  const QuizScoreboard(this.scores);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: scores
            .map(
              (score) => score.isCorrect
                  ? Icon(Icons.check, color: Colors.green)
                  : Icon(Icons.close, color: Colors.red),
            )
            .toList(),
      ),
    );
  }
}
