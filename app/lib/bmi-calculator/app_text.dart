import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  const AppLabel(this.text, {Key key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
    );
  }
}
