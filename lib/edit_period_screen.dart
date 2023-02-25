import 'package:circular/circular.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class EditPeriodScreen extends StatefulWidget {
  const EditPeriodScreen({Key? key}) : super(key: key);

  @override
  State<EditPeriodScreen> createState() => _EditPeriodScreenState();
}

class _EditPeriodScreenState extends State<EditPeriodScreen> {
  int value = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(20),
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
                "Period Length ",
                style: TextStyle(
                    fontSize: 50, color: blackColor, fontFamily: 'Tempestua'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: const Text(
            "Bleeding usually lasts between 4-7 days.",
            style: TextStyle(
                color: Colors.black54, fontSize: 20, fontFamily: 'Lato'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: CircularSlider(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(-10, -10),
                      color: Colors.white,
                      blurRadius: 20,
                      spreadRadius: 1),
                  BoxShadow(
                      offset: Offset(10, 10),
                      color: Color.fromARGB(155, 158, 158, 158),
                      blurRadius: 15,
                      spreadRadius: 1)
                ]),
            maxValue: 20,
            radius: 120,
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 30, fontFamily: 'Lato'),
            ),
            color: Color(0xfffEEEEE),
            sliderColor: primaryColor,
            unSelectedColor: Colors.white70,
            onDrag: (value) {
              setState(() {
                this.value = value;
              });
            },
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
