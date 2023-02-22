import 'package:flutter/material.dart';
import 'package:period/constants.dart';
import 'package:period/Element/floating_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainBgColor,
      extendBody: true,
      bottomNavigationBar: FloatingBottomNavBar(),
    );
  }
}
