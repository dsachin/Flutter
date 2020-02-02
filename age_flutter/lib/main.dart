import 'dart:async';
import 'package:flutter/material.dart';
import 'ageCalculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age',
      home: Scaffold(backgroundColor: Colors.black, body: AgeApp()),
    );
  }
}

class AgeApp extends StatefulWidget {
  @override
  _AgeAppState createState() => _AgeAppState();
}

class _AgeAppState extends State<AgeApp> {
  Age age = Age();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                child: Text(
                  "Age:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              FlatButton(
                textColor: Colors.cyan,
                child: Text(
                  age.time.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                onPressed: () {
                  setAge();
                },
              ),
            ]),
      ),
    );
  }

  void setAge() {
    Timer.periodic(new Duration(milliseconds: 200), (timer) {
      setState(() {
        age.getAge();
      });
    });
  }
}
