import 'package:age_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ageCalculator.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();

  Future read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'myDate';
    String value = prefs.getString(key) ?? "1995-04-29 00:00:00.000";
    print('read: $value');
    return value;
  }
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Current Age-Date: ",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("${Age.dob.day}-${Age.dob.month}-${Age.dob.year}",
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),
            ),
            IconButton(
                tooltip: "Sets new date for app.",
                color: Colors.white,
                icon: Icon(Icons.access_time),
                iconSize: 50.0,
                onPressed: () {
                  selectDate(context);
                }),
            Text("Select Mode:"),
          ],
        ),
      ),
    );
  }

  Future selectDate(context) async {
    final DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(1947, 8, 15),
        lastDate: DateTime.now());
    if (datePicked != null) {
      print(datePicked);
      setState(() {
        Age.dob = datePicked;
        _save(datePicked.toString());
      });
    }
    Navigator.pop(context);
    return datePicked;
  }

  _save(String datepicked) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'myDate';
    prefs.setString(key, datepicked);
    print('saved $datepicked');
  }

  void changeTheme(value) {
    if (Constants.kIsDark) {
      Constants.kBackgroundColor = Colors.white;
      Constants.kAgeColor = Colors.black;
    } else {
      Constants.kBackgroundColor = Colors.black;
      Constants.kAgeColor = Colors.white;
    }
  }
}
