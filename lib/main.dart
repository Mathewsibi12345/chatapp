import 'package:flutter/material.dart';
import 'package:flutterapp/view/welcome.dart';


void main() {
  runApp(HalodekApp());
}

class HalodekApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
