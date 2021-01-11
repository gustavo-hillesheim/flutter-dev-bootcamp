import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/flash-chat/screens/chat_screen.dart';
import 'package:flutter_dev_bootcamp/flash-chat/screens/login_screen.dart';
import 'package:flutter_dev_bootcamp/flash-chat/screens/registration_screen.dart';
import 'package:flutter_dev_bootcamp/flash-chat/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (_) => WelcomeScreen(),
        ChatScreen.route: (_) => ChatScreen(),
        RegistrationScreen.route: (_) => RegistrationScreen(),
        LoginScreen.route: (_) => LoginScreen(),
      }
    );
  }
}
