import 'package:circular/circular.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class EditCycleScreen extends StatefulWidget {
  int cycleLength=0;
  EditCycleScreen({super.key,  required this.cycleLength });

  @override
  State<EditCycleScreen> createState() => _EditCycleScreenState();
}

class _EditCycleScreenState extends State<EditCycleScreen> {

  // int cycleLength; // shared pref
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
          margin: const EdgeInsets.only(left: 40, right: 40),
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
            maxValue: 40,
            radius: 120,
            child: Text(
              widget.cycleLength.toString(),
              style: TextStyle(fontSize: 30, fontFamily: 'Lato'),
            ),
            color: Color(0xfffec9c9),
            sliderColor: primaryColor,
            unSelectedColor: Colors.white70,
            onDrag: (value) {
              setState(() {
                // print('new cycle length is $value');
                widget.cycleLength = value;
              });
            },
          ),
        ),
        Container(
            margin: EdgeInsets.only(top:160,left: 40,right: 40),
            child: ElevatedButton(
                onPressed: () {
                  print('${widget.cycleLength}');
                  saveInt(widget.cycleLength);
                  Navigator.pop(context,widget.cycleLength);
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

  saveInt(int cycle) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt('cycleLength', cycle);
  }
}
