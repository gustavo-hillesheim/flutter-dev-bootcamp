import 'package:flutter/material.dart';

const appCardColor = Color(0xFF1D1E33);

class AppCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  const AppCard({this.color = appCardColor, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
