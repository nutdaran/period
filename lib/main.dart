import 'package:flutter/material.dart';
import 'CalendarScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/calendar':(context) => const CalendarScreen(),
      },
    );
  }
}

