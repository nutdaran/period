import 'package:flutter/material.dart';
import 'package:period/Element/buttonFactory.dart';
import 'package:period/constants.dart';

class FlowMemoScreen extends StatefulWidget {
  const FlowMemoScreen({Key? key}) : super(key: key);

  @override
  State<FlowMemoScreen> createState() => _FlowMemoScreenState();
}

class _FlowMemoScreenState extends State<FlowMemoScreen> {
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
                      Navigator.pop(context,"20%");
                    }),
                buttonFactory(
                    theColor: Colors.red.shade200,
                    data: "40%",
                    theOnPressedFunc: () {
                      Navigator.pop(context,"40%");
                    }),
                buttonFactory(
                    theColor: Colors.red.shade300,
                    data: "60%",
                    theOnPressedFunc: () {
                      Navigator.pop(context, "60%");
                    }),
                buttonFactory(
                    theColor: Colors.red.shade400,
                    data: "80%",
                    theOnPressedFunc: () {
                      Navigator.pop(context, "80%");
                    }),
                buttonFactory(
                    theColor: Colors.red.shade500,
                    data: "100%",
                    theOnPressedFunc: () {
                      Navigator.pop(context, "100%");
                    }),
              ])),
    ])
    );
  }
}