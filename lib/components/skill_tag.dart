import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/models/skill.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class SkillTag<T> extends StatelessWidget {
  final String name;
  Color borderColor;
  Color backgroundColor;
  double borderWidth;
  T value;
  Function onTap;
  SkillTag(
      {this.name,
      this.backgroundColor,
      this.borderColor,
      this.borderWidth,
      this.onTap,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: RaisedButton(
          child: Text(
            name,
            style: TextStyle(fontSize: 12),
          ),
          onPressed: onTap,
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          )),
    );
  }
}

class GroupSkillTag extends StatelessWidget {
  List<Skill> tags;
  // List<T> tagValues;

  Color borderColor;
  Color backgroundColor;
  double borderWidth;
  final Function(Skill) onTap;

  GroupSkillTag(
      {@required this.tags,
      this.borderColor = kAppDefaultColor,
      this.backgroundColor = Colors.white,
      this.borderWidth = 1,
      this.onTap});

  List<SkillTag> _buildTagList() {
    List<SkillTag> skillTags = [];
    for (var i = 0; i < tags.length; i++) {
      SkillTag skillTag = SkillTag(
        backgroundColor: backgroundColor,
        name: tags[i].name,
        borderColor: borderColor,
        borderWidth: borderWidth,
        value: tags[i].id,
        onTap: () {
          onTap(tags[i]);
        },
      );
      skillTags.add(skillTag);
    }
    return skillTags;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 0,
      children: _buildTagList(),
    );
  }
}
