import 'package:flutter/material.dart';
import 'package:period/Element/buttonFactory.dart';
import 'package:period/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorMemoScreen extends StatefulWidget {
  Color color = primaryColor;
  ColorMemoScreen({Key? key}) : super(key: key);

  @override
  State<ColorMemoScreen> createState() => _ColorMemoScreenState();
}

class _ColorMemoScreenState extends State<ColorMemoScreen> {
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
            Navigator.pop(context,widget.color);
          },
        ),
        elevation: 0,
        backgroundColor: mainBgColor,
      ),
      backgroundColor: mainBgColor,
      body:
      Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Row(
            children: const [
              Text(
                "Add memo",
                style: TextStyle(
                    fontSize: 50, color: blackColor, fontFamily: 'Tempestua'),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: const Text(
            "Period blood color",
            style: TextStyle(
                color: Colors.black54, fontSize: 25, fontFamily: 'Lato'),
          ),
        ),
        Container(
            child: Column(children: [
              buttonFactory(
                  theColor: Color(0xffff9981),
                  data: "Pink",
                  theOnPressedFunc: () {
                    setColor("Color(0xffff9981)");
                    Navigator.pop(context, Color(0xffff9981));
                  }),
              buttonFactory(
                  theColor: Color(0xfffe9154),
                  data: "Orange",
                  theOnPressedFunc: () {
                    setColor("Color(0xfffe9154)");
                    Navigator.pop(context, Color(0xfffe9154));
                  }),
              buttonFactory(
                  theColor: Color(0xfffe4c1d),
                  data: "Bright Red",
                  theOnPressedFunc: () {
                    setColor("Color(0xfffe4c1d)");
                    Navigator.pop(context, Color(0xfffe4c1d));
                  }),
              buttonFactory(
                  theColor: Color(0xffd06295),
                  data: "Purple",
                  theOnPressedFunc: () {
                    setColor("Color(0xffd06295)");
                    Navigator.pop(context, Color(0xffd06295));
                  }),
              buttonFactory(
                  theColor: Color(0xffa22800),
                  data: "Brown",
                  theOnPressedFunc: () {
                    setColor("Color(0xffa22800)");
                    Navigator.pop(context, Color(0xffa22800));
                  }),
              buttonFactory(
                  theColor: Color(0xff870101),
                  data: "Dark Red",
                  theOnPressedFunc: () {
                    setColor("Color(0xff870101)");
                    Navigator.pop(context, Color(0xff870101));
                  }),
              buttonFactory(
                  theColor: Color(0xff727272),
                  data: "Grey",
                  theOnPressedFunc: () {
                    setColor("Color(0xff727272)");
                    Navigator.pop(context, Color(0xff727272));
                  }),
            ])),
      ]));
  }

  setColor(String color) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('color', color);
  }
}
