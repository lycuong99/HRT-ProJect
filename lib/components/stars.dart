import 'package:flutter/material.dart';

class ListStar extends StatelessWidget {
  final double size;
  final int count;
  final int rate;
  MaterialColor color = Colors.yellow;

  ListStar(
      {this.size = 5, @required this.count, @required this.rate, this.color});

  List<Widget> _getListStar() {
    List<Widget> stars = [];
    for (int i = 1; i <= this.count; i++) {
      if (i <= rate) {
        stars.add(Icon(
          Icons.star,
          size: this.size,
          color: color,
        ));
      } else {
        stars.add(Icon(
          Icons.star_border,
          size: this.size,
          color: color,
        ));
      }
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    if (count < rate) throw Exception('Count < Rate');

    return Row(
      children: _getListStar(),
    );
  }
}
