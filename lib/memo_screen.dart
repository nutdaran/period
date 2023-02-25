import 'package:flutter/material.dart';
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
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 80, left: 40, right: 40),
          child: Row(
            children: const [
              Text(
                "Cycle Length ",
                style: TextStyle(
                    fontSize: 50, color: blackColor, fontFamily: 'Tempestua'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: const Text(
            "We use cycle length to predict your next period start date",
            style: TextStyle(
                color: Colors.black54, fontSize: 20, fontFamily: 'Lato'),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top:70,left: 40,right: 40),
            child: ElevatedButton(
                onPressed: () {
                  print('save data and load the home screen');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: doneButtonColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const SizedBox(
                  width: 300,
                  height:60,
                  child: Center(
                    child: Text("Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Lato'),
                    ),
                  ),
                )))
      ]),
    );
  }
}

