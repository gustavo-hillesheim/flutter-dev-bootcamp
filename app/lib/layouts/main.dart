import 'package:flutter/material.dart';

void main() {
  runApp(LayoutsApp());
}

class LayoutsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layouts',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LayoutsHomeScreen(),
    );
  }
}

class LayoutsHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(width: 100, color: Colors.red),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 100, height: 100, color: Colors.yellow),
                Container(width: 100, height: 100, color: Colors.green),
              ],
            ),
          ),
          Container(width: 100, color: Colors.blue)
        ],
      ),
    );
  }
}
