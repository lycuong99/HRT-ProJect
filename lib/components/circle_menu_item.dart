import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/screens/search_screen.dart';

class CircleMenuItem extends StatelessWidget {
  String title;
  ImageProvider img;

  CircleMenuItem({@required this.title, @required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: SearchAppBarDelegate(),
          query: 'title',
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                radius: 25, backgroundColor: Colors.blue, backgroundImage: img),
            Text(
              title,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
