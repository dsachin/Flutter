import 'package:flutter/material.dart';

class ReusableDataWidget extends StatelessWidget {
  ReusableDataWidget({this.icon, this.iconText});
  final IconData icon;
  final String iconText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          iconText,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
