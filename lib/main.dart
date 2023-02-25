import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'edit_period_screen.dart';
import 'edit_cycle_screen.dart';
import 'memo_screen.dart';

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
        '/editCycle': (context) => const EditCycleScreen(),
        '/editPeriod': (context) => const EditPeriodScreen(),
      },
    );
  }
}

