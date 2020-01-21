import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  //To play audio note from Assets folder.
  final player = AudioCache();

  void playSound(int soundNumber) {
    player.play('note$soundNumber.wav');
  }

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.cyan,
    Colors.orange,
    Colors.teal,
    Colors.green
  ];

  //Creates Xylophone Keys using flat button
  List<Widget> buildKey() {
    List<Widget> widgets = new List<Expanded>();
    for (int i = 0; i < 7; i++) {
      var widget = Expanded(
        child: FlatButton(
          color: colors[i],
          onPressed: () {
            playSound(i + 1);
          },
        ),
      );
      widgets.add(widget);
    }
    ;
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...buildKey(),
            ],
          ),
        ),
      ),
    );
  }
}
