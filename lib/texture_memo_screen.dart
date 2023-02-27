import 'package:flutter/material.dart';
import 'package:period/Element/buttonFactory.dart';
import 'package:period/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextureMemoScreen extends StatefulWidget {
  String texture = "Texture";
  TextureMemoScreen({Key? key}) : super(key: key);

  @override
  State<TextureMemoScreen> createState() => _TextureMemoScreenState();
}

class _TextureMemoScreenState extends State<TextureMemoScreen> {

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
                          setTexture("Clots");
                          Navigator.pop(context, "Clots");
                        }),
                    buttonFactory(
                        theColor: primaryColor,
                        data: "Jelly-like",
                        theOnPressedFunc: () {
                          setTexture("Jelly-like");
                          Navigator.pop(context, "Jelly-like");
                        }),
                    buttonFactory(
                        theColor: primaryColor,
                        data: "No clots",
                        theOnPressedFunc: () {
                          setTexture("No clots");
                          Navigator.pop(context, "No clots");
                        }),
                    buttonFactory(
                        theColor: primaryColor,
                        data: "Watery",
                        theOnPressedFunc: () {
                          setTexture("Watery");
                          Navigator.pop(context, "Watery");
                        }),
                  ])),
            ]));
  }

  setTexture(String texture) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('texture', texture);
  }

}