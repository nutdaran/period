import 'package:flutter/material.dart';
import 'package:period/constants.dart';

class buttonFactory extends StatelessWidget {
  buttonFactory({
  required this.theColor,
  required this.data,
  required this.theOnPressedFunc});

  final Color theColor;
  final String data;
  final VoidCallback theOnPressedFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Column(children: [
        ElevatedButton(
          onPressed: theOnPressedFunc
          ,
          style: ElevatedButton.styleFrom(
              backgroundColor: theColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: SizedBox(
            width: 300,
            height: 60,
            child: Center(
              child: Text(data.toString(),
                style: const TextStyle(
                    fontSize: 20, fontFamily: 'Lato'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
