import 'package:flutter/material.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class SectionCustom extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget suffix;
  double spaceHeaderContent;
  EdgeInsets paddingTitle;
  EdgeInsets padding;
  EdgeInsets margin;
  TextStyle titleStyle = kProfileTitle;
  BoxDecoration boxDecoration;

  SectionCustom(
      {this.title,
      this.child,
      this.paddingTitle = const EdgeInsets.only(left: kPaddingHorizonApp),
      this.titleStyle,
      this.spaceHeaderContent,
      this.suffix,
      this.boxDecoration,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    titleStyle ??= kProfileTitle;
    spaceHeaderContent ??= 10;
    return Container(
      margin: margin,
      padding: padding,
      decoration: boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: paddingTitle ?? EdgeInsets.zero,
            child: suffix == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: titleStyle,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: titleStyle,
                      ),
                      suffix
                    ],
                  ),
          ),
          SizedBox(
            height: spaceHeaderContent,
          ),
          Container(
            child: child,
          ),
        ],
      ),
    );
  }
}
