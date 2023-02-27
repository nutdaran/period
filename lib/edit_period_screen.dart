import 'package:circular/circular.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class EditPeriodScreen extends StatefulWidget {
  int periodLength = 0;
  EditPeriodScreen({super.key, required this.periodLength});

  @override
  State<EditPeriodScreen> createState() => _EditPeriodScreenState();
}

class _EditPeriodScreenState extends State<EditPeriodScreen> {

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
          margin: const EdgeInsets.only(left: 40, right: 40),
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
          margin: const EdgeInsets.only(top: 80),
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
              widget.periodLength.toString(),
              style: TextStyle(fontSize: 30, fontFamily: 'Lato'),
            ),
            color: Color(0xfffec9c9),
            sliderColor: primaryColor,
            unSelectedColor: Colors.white70,
            onDrag: (value) {
              setState(() {
                widget.periodLength = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top:160,left: 40,right: 40),
            child: ElevatedButton(
                onPressed: () {
                  print('save data and load the home screen');
                  setPeriod(widget.periodLength);
                  Navigator.pop(context,widget.periodLength);
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

  setPeriod(int period) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('periodLength', period);
  }
}
