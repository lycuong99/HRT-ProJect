import 'package:flutter/material.dart';

import 'package:hire_remote_team/ultilites/constants.dart';

class RoundButtonPureFullWidth extends StatelessWidget {
  final String text;
  Function onPressed;
  RoundButtonPureFullWidth({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(13.0))),
      child: Text(text, style: kTextStyleButtonWhite),
      constraints: BoxConstraints.expand(height: 45),
      onPressed: this.onPressed,
    );
  }
}

class RoundButtonFullWidth extends StatelessWidget {
  final String text;
  final Color color;
  final Color fontColor;
  Function onPressed;
  RoundButtonFullWidth({this.text, this.onPressed, this.color, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: this.color,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(13.0))),
      child: Text(text,
          style: TextStyle(
              color: this.fontColor,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      constraints: BoxConstraints.expand(height: 45),
      onPressed: this.onPressed,
    );
  }
}
