import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class ReviewCard extends StatelessWidget {
  String comment;
  String rator;
  double rating;
  String date;
  String imgProfileURL;

  ReviewCard(
      {this.comment, this.rator, this.rating, this.date, this.imgProfileURL});

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
                  rator,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemCount: 5,
                  itemSize: 20,
                  initialRating: rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                ),
                Text(
                  date,
                  style: kContentCard,
                )
              ],
            ),
            Text(comment)
          ],
        ),
      ),
    );
  }
}
