import 'package:flutter/material.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class BottomBarButton extends StatelessWidget {
  String right;
  Function rightOnPressed;

  Widget left;
  Function leftOnPressed;

  BottomBarButton(
      {this.right, this.rightOnPressed, this.left, this.leftOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: MaterialButton(
                focusColor: Colors.white,
                color: Colors.white,
                elevation: 0,
                onPressed: leftOnPressed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(
                      color: kAppDefaultColor,
                      width: 0.25,
                    )),
                child: left,
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: RaisedButton(
              elevation: 0,
              color: kAppDefaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: (Text(
                right,
                style: TextStyle(color: Colors.white),
              )),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              onPressed: rightOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
