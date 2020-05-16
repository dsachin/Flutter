import 'package:flutter/material.dart';
import 'constants.dart';

class BottomNavigationButton extends StatelessWidget {
  BottomNavigationButton({@required this.onTap, @required this.title});
  final Function onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
