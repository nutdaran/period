import 'package:flutter/material.dart';
import 'Element/floating_bottom_nav_bar.dart';
import 'constants.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      extendBody: true,
      bottomNavigationBar: FloatingBottomNavBar(),
    );
  }
}

