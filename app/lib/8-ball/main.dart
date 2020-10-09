import 'dart:math';

import 'package:flutter/material.dart';

const BALL_YES = 1;
const BALL_NO = 2;
const BALL_LATER = 3;
const BALL_ANSWER_IS_YES = 4;
const BALL_NO_IDEA = 5;

void main() {
  runApp(Ball8App());
}

class Ball8App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Ball 8', home: Ball8HomeScreen());
  }
}

class Ball8HomeScreen extends StatefulWidget {
  @override
  _Ball8HomeScreenState createState() => _Ball8HomeScreenState();
}

class _Ball8HomeScreenState extends State<Ball8HomeScreen> {
  int ballNumber = BALL_LATER;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: _primaryColor),
      child: Scaffold(
        backgroundColor: _primaryColor.withAlpha(255),
        appBar: AppBar(
          title: Text('Ball 8'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            _BackgroundText(ballNumber: ballNumber,),
            Center(
              child: Ball8Button(
                initialBallNumber: ballNumber,
                onBallNumberChange: _updateBallNumber,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get _primaryColor => ({
        BALL_YES: Colors.greenAccent,
        BALL_NO: Colors.redAccent,
        BALL_NO_IDEA: Colors.cyan,
        BALL_ANSWER_IS_YES: Colors.greenAccent,
        BALL_LATER: Colors.blueGrey
      }[ballNumber]);

  void _updateBallNumber(int newBallNumber) {
    setState(() {
      this.ballNumber = newBallNumber;
    });
  }
}

class _BackgroundText extends StatelessWidget {
  final int ballNumber;
  const _BackgroundText({this.ballNumber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _backgroundText,
        style: TextStyle(
          height: 1.1,
          fontSize: 700,
          color: Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }

  String get _backgroundText => ({
    BALL_YES: 'Y',
    BALL_NO: 'X',
    BALL_NO_IDEA: '?',
    BALL_ANSWER_IS_YES: 'Y',
    BALL_LATER: ''
  }[ballNumber]);
}

class Ball8Button extends StatefulWidget {
  final int initialBallNumber;
  final ValueChanged<int> onBallNumberChange;

  const Ball8Button({this.initialBallNumber, this.onBallNumberChange});

  @override
  _Ball8ButtonState createState() => _Ball8ButtonState();
}

class _Ball8ButtonState extends State<Ball8Button>
    with SingleTickerProviderStateMixin {
  int ballNumber;
  bool isPressing = false;

  @override
  void initState() {
    super.initState();
    this.ballNumber = widget.initialBallNumber;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _randomizeBall,
        onTapDown: (_) => setPressing(true),
        onTapUp: (_) => setPressing(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _imageWidth,
          child: Image.asset('assets/8-ball/ball$ballNumber.png'),
        ));
  }

  void _randomizeBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
      widget.onBallNumberChange(ballNumber);
    });
  }

  void setPressing(bool isPressing) {
    setState(() {
      this.isPressing = isPressing;
    });
  }

  double get _imageWidth => isPressing ? 300 : 325;
}
