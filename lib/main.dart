// This is a basic Flutter login screen implementation with email and password fields, including validation and styling.
import 'package:flutter/material.dart';
import 'package:my_app/page/home.dart';

// Entry point of the application.
// The main function initializes the app by running the MyApp widget.
void main() {
  runApp(MyApp());
}

// The MyApp class is a stateless widget that serves as the root of the application.
// It returns a MaterialApp widget with the LoginScreen as its home.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override // The build method describes how to display the widget in terms of other, lower-level widgets.
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

