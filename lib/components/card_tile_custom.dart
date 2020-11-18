import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  Widget leading;
  Widget title;

  CardTile({this.leading, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        SizedBox(
          width: 5,
        ),
        title
      ],
    );
  }
}
