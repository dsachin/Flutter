import 'dart:async';
import 'package:age_flutter/constants.dart';
import 'package:age_flutter/setting.dart';
import 'package:flutter/material.dart';
import 'ageCalculator.dart';

class AgeApp extends StatefulWidget {
  @override
  _AgeAppState createState() => _AgeAppState();
}

class _AgeAppState extends State<AgeApp> {
  bool isShowAge = true;
  Age age = Age();

  @override
  void initState() {
    setAge();
    getAgeFromData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundColor,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  isShowAge = false;
                });
                Navigator.pushNamed(context, '/setting');
              }),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
              child: Text(
                "Age:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Constants.kAgeHeadingColor,
                ),
              ),
            ),
            FlatButton(
              child: Text(
                Age.time,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Constants.kAgeColor,
                  fontSize: 40.0,
                ),
              ),
              onPressed: () {
                setAge();
              },
            ),
          ]),
        ),
      ),
    );
  }

  void setAge() {
    if (isShowAge) {
      Timer.periodic(new Duration(milliseconds: 200), (timer) {
        setState(() {
          age.getAge();
        });
      });
    }
  }

  void getAgeFromData() async {
    String date = await Setting().read();
    Age.dob = DateTime.tryParse(date);
  }
}
