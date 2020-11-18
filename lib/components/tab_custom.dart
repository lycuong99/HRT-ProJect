import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabCustom01 extends StatelessWidget {
  final String title;

  TabCustom01({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              bottomRight: Radius.zero,
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5)),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
