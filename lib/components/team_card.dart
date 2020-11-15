import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class VerticalTeamCard extends StatelessWidget {
  String name;
  String address;
  int totalMember;
  Image img;
  double salarySuggest;

  Function onTap;

  final double paddingLeft;

  VerticalTeamCard(
      {this.name,
      this.address,
      this.totalMember,
      this.img,
      this.paddingLeft,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.only(left: paddingLeft),
        child: Container(
            margin: EdgeInsets.all(3),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1.0,
                    offset: Offset(0, 1))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: img,
                  flex: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    name,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: kTitleCard_1,
                  ),
                ),
                Expanded(
                  child: Text(
                    address,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: kTitleCard_1,
                  ),
                ),
                Expanded(
                  child: Text(
                    '$totalMember members',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ResultTeamCard extends StatelessWidget {
  String imgUrl;
  String name;
  String price;
  double rating;
  Function onTap;
  ResultTeamCard({this.imgUrl, this.name, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(top: 14, right: 2, left: 2, bottom: 2),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xfffafafa),
          borderRadius: BorderRadius.circular(11.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 0.5, offset: Offset(0, 0))
          ]),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 86,
              width: 86,
              // child: CircleAvatar(
              //   radius: 25.0,
              //   backgroundColor: Colors.white,
              //   backgroundImage: AssetImage(imgUrl),
              // ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(width: 1.5, color: kGreyColor),
                  image: DecorationImage(
                    image: AssetImage(imgUrl),
                    fit: BoxFit.cover,
                  )),
              margin: EdgeInsets.all(10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.name,
                      style: kTitleCard,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.grey,
                        ),
                        Text(
                          '',
                          style: kContentCard,
                        )
                      ],
                    )
                  ],
                ),
                RatingBar.builder(
                  initialRating: this.rating,
                  ignoreGestures: true,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25,
                  itemBuilder: (context, _) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "\$1000/month",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.lightGreenAccent),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
// height: 130,
// padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
// decoration: BoxDecoration(
// color: Colors.white70,
// borderRadius: BorderRadius.circular(25.0),
// boxShadow: [
// BoxShadow(
// color: Colors.black12, blurRadius: 1.0, offset: Offset(0, 1))
// ],
// ),
//
// )
