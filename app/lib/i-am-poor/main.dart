import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IAmPoorHomeScreen(),
    );
  }
}

class IAmPoorHomeScreen extends StatefulWidget {
  @override
  _IAmPoorHomeScreenState createState() => _IAmPoorHomeScreenState();
}

class _IAmPoorHomeScreenState extends State<IAmPoorHomeScreen> {
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          progress < 100 ? 'I am poor' : 'I became rich!',
          style: TextStyle(fontSize: 32),
        ),
        backgroundColor: appBarColor,
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
            onTap: _increaseProgress, child: IAmPoorImage(progress: progress),),
      ),
    );
  }

  Color get appBarColor {
    final int initialValue = 140;
    final int redOffset = (progress * 1.4).floor();
    final int greenOffset = (progress * .63).floor();
    final int blueOffset = (progress * .76).floor();
    final int red = initialValue - redOffset;
    final int green = initialValue - greenOffset;
    final int blue = initialValue - blueOffset;
    return Color.fromARGB(255, red, green, blue);
  }

  Color get backgroundColor {
    final int initialValue = 255;
    final int redOffset = (progress * 1.78).floor();
    final int greenOffset = (progress * .73).floor();
    final int blueOffset = (progress * .83).floor();
    final int red = initialValue - redOffset;
    final int green = initialValue - greenOffset;
    final int blue = initialValue - blueOffset;
    return Color.fromARGB(255, red, green, blue);
  }

  void _increaseProgress() {
    if (this.progress < 100) {
      setState(() {
        this.progress += 5;
      });
    }
  }
}

class IAmPoorImage extends StatelessWidget {
  final int progress;

  const IAmPoorImage({this.progress});

  @override
  Widget build(BuildContext context) {
    if (progress < 100) {
      return Image.asset('assets/i-am-poor/poor-icon.png', scale: scale);
    } else {
      return Image.asset('assets/i-am-poor/rich-icon.png', scale: 2);
    }
  }

  double get scale => 2 + progress / 50 * 2;
}
