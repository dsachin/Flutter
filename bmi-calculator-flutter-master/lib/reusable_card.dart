import 'package:flutter/material.dart';

class ReusableExpanded extends StatelessWidget {
  ReusableExpanded({this.color, this.reusableCard, this.onPress});
  final Color color;
  final Widget reusableCard;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: reusableCard,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
