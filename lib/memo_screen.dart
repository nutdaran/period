import 'package:flutter/material.dart';
import 'package:period/Element/buttonFactory.dart';
import 'package:period/constants.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({Key? key}) : super(key: key);

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
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
      // body: flowMemo(context),
      // body: colorMemo(context),
      body: textureMemo(context),
    );
  }

  Widget flowMemo(BuildContext context) {
    return Column(children: [
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
          "Blood flow",
          style: TextStyle(
              color: Colors.black54, fontSize: 25, fontFamily: 'Lato'),
        ),
      ),
      Container(
          child: Column(children: [
        buttonFactory(
            theColor: Colors.red.shade100,
            data: "20%",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Colors.red.shade200,
            data: "40%",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Colors.red.shade300,
            data: "60%",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Colors.red.shade400,
            data: "80%",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Colors.red.shade500,
            data: "100%",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
      ])),
    ]);
  }

  Widget colorMemo(BuildContext context) {
    return Column(children: [
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
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Color(0xfffe9154),
            data: "Orange",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Color(0xfffe4c1d),
            data: "Bright Red",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Color(0xffd06295),
            data: "Purple",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Color(0xffa22800),
            data: "Brown",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Color(0xff870101),
            data: "Dark Red",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
        buttonFactory(
            theColor: Color(0xff727272),
            data: "Grey",
            theOnPressedFunc: () {
              Navigator.pop(context);
            }),
      ])),
    ]);
  }

  Widget textureMemo(BuildContext context) {
    return Column(
        children: [
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
                  Navigator.pop(context);
                }),
            buttonFactory(
                theColor: primaryColor,
                data: "Jelly-like",
                theOnPressedFunc: () {
                  Navigator.pop(context);
                }),
            buttonFactory(
                theColor: primaryColor,
                data: "No clots",
                theOnPressedFunc: () {
                  Navigator.pop(context);
                }),
            buttonFactory(
                theColor: primaryColor,
                data: "Watery",
                theOnPressedFunc: () {
                  Navigator.pop(context);
                }),
          ])),
    ]);
  }
}
