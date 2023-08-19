import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'LogIn.dart';
import 'Screen2/Switch.dart';
import 'Screens/LoginUi.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: CustomSwitch(),
    );
  }
}
