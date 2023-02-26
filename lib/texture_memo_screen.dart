import 'package:flutter/material.dart';
import 'package:period/Element/buttonFactory.dart';
import 'package:period/constants.dart';

class TextureMemoScreen extends StatefulWidget {
  const TextureMemoScreen({Key? key}) : super(key: key);

  @override
  State<TextureMemoScreen> createState() => _TextureMemoScreenState();
}

class _TextureMemoScreenState extends State<TextureMemoScreen> {
  late String texture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.all(20),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 40,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: mainBgColor,
        ),
        backgroundColor: mainBgColor,
        body:
        Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: const [
                    Text(
                      "Add memo",
                      style: TextStyle(
                          fontSize: 50,
                          color: blackColor,
                          fontFamily: 'Tempestua'),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: const Text(
                  "Blood texture",
                  style: TextStyle(
                      color: Colors.black54, fontSize: 25, fontFamily: 'Lato'),
                ),
              ),
              Container(
                  child: Column(children: [
                    buttonFactory(
                        theColor: primaryColor,
                        data: "Clots",
                        theOnPressedFunc: () {
                          texture = "Clots";
                          Navigator.pop(context, texture);
                        }),
                    buttonFactory(
                        theColor: primaryColor,
                        data: "Jelly-like",
                        theOnPressedFunc: () {
                          texture = "Jelly-like";
                          print("$texture");
                          Navigator.pop(context, texture);
                        }),
                    buttonFactory(
                        theColor: primaryColor,
                        data: "No clots",
                        theOnPressedFunc: () {
                          texture = "No clots";
                          Navigator.pop(context,texture);
                        }),
                    buttonFactory(
                        theColor: primaryColor,
                        data: "Watery",
                        theOnPressedFunc: () {
                          texture = "Watery";
                          Navigator.pop(context,texture);
                        }),
                  ])),
            ]));
  }
}