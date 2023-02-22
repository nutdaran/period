import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'CalendarScreen.dart';
import 'EditPeriodScreen.dart';
import 'MemoScreen.dart';

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
        '/': (context) => const HomeScreen(),
        '/calendar':(context) => const CalendarScreen(),
        '/memo': (context) => const MemoScreen(),
        '/editPeriod': (context) => const EditPeriodScreen(),
      },
    );
  }
}

