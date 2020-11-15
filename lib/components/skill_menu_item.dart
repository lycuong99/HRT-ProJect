import 'package:flutter/material.dart';

class CircleMenuItem extends StatelessWidget {
  String title;
  ImageProvider img;

  CircleMenuItem({@required this.title, @required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              radius: 22, backgroundColor: Colors.blue, backgroundImage: img),
          Text(
            title,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
