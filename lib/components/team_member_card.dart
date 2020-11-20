import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class MemberCard extends StatelessWidget {
  String role;
  String name;
  String imgProfileURL;
  String memberId;
  MemberCard(
      {this.name,
      this.memberId,
      this.role = 'developers',
      this.imgProfileURL = 'images/avatar_1.png'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      // margin: EdgeInsets.only(bottom: 10),
      height: 110,
      decoration: BoxDecoration(
          // color: Colors.grey[100],
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(imgProfileURL),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Text(role)
          ],
        ),
      ),
    );
  }
}
