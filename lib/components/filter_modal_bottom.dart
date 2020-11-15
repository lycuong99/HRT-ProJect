import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:hire_remote_team/components/section_custom.dart';
import 'package:hire_remote_team/models/filter.dart';
import 'package:hire_remote_team/models/skill.dart';
import 'package:hire_remote_team/providers/data_filter.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

const kTitleFilterStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

class SkillFilter {
  List<Skill> _datas;
  List<String> _values;
  List<Skill> _selectedSkills = [];
  Map<String, bool> maps;

  List<Skill> get datas => _datas;

  getResources() async {
    // _datas = await DataFilter().getSkills();
    _datas = DataFilter().getExample();
    _values = _datas.map((e) => e.name).toList();
  }

  changeSelectedSkill(int indexInValues, bool isSelected) {
    _updateSelectedListSkill(_values[indexInValues], isSelected);
  }

  _updateSelectedListSkill(String skillName, bool isSelected) {
    isSelected
        ? _selectedSkills.add(getSkillByNames(skillName))
        : _selectedSkills.removeWhere((element) => element.name == skillName);
  }

  Skill getSkillByNames(String nameSkill) {
    return _datas.firstWhere((element) => element.name == nameSkill);
  }

  List<String> get values => _values;

  List<Skill> get selectedSkills => _selectedSkills;
}

class SizeTeamItem {
  int min;
  int max;
  String title;

  SizeTeamItem({this.min, this.max, this.title});
}

class FilterModalBottom extends StatefulWidget {
  Function onPressed;
  FilterObj filterObj;
  FilterModalBottom({this.onPressed, this.filterObj});

  @override
  _FilterModalBottomState createState() => _FilterModalBottomState();
}

List<String> toggleItem = [
  'portrait',
  'scenery',
  'advertisement',
];

List<SizeTeamItem> sizeTeamItem = [
  SizeTeamItem(min: 1, max: 5, title: '1-5'),
  SizeTeamItem(min: 6, max: 10, title: '6-10'),
  SizeTeamItem(min: 11, max: 20, title: '11-20 '),
  SizeTeamItem(min: 21, max: 50, title: '21-50 '),
  SizeTeamItem(min: 51, max: 100000, title: '50+')
];

class _FilterModalBottomState extends State<FilterModalBottom> {
  double rating = 4;
  List<bool> isToggleSelected = [false, false, false];
  double distance = 50;
  double _lowerValue = 0;
  double _upperValue = 0;
  RangeValues _values = RangeValues(100, 400);
  RangeLabels labels = RangeLabels('1', "100");
  double minPrice;
  double maxPrice;
  SkillFilter _skillFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _skillFilter = SkillFilter();
    _skillFilter.getResources();

    rating = widget.filterObj.minRating;
    minPrice = widget.filterObj.minPrice;
    maxPrice = widget.filterObj.maxPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.only(left: 5, right: 10, top: 15),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.tune,
                    size: 30,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 430,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SectionCustom(
                    title: 'Technologies',
                    spaceHeaderContent: 4,
                    titleStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    paddingTitle: const EdgeInsets.symmetric(
                        horizontal: kPaddingHorizonApp),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingHorizonApp),
                      child: GroupButton(
                        onSelected: (index, isSelected) {
                          _skillFilter.changeSelectedSkill(index, isSelected);
                        },
                        isRadio: false,
                        unselectedTextStyle: TextStyle(color: kAppDefaultColor),
                        spacing: 5,
                        buttons: _skillFilter.values,
                        selectedColor: kAppDefaultColor,
                        unselectedBorderColor: kAppDefaultColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SectionCustom(
                    paddingTitle:
                        EdgeInsets.symmetric(horizontal: kPaddingHorizonApp),
                    title: 'Price',
                    titleStyle: kTitleFilterStyle,
                    suffix: Text(
                      'Range \$${_values.start.floor()} - \$${_values.end.floor()}',
                      style: TextStyle(
                          color: kAppDefaultColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        activeTrackColor: kAppDefaultColor.withOpacity(0.9),
                        inactiveTrackColor: Color(0xff8d8e98).withOpacity(0.4),
                        thumbColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                        valueIndicatorColor: Colors.redAccent.withOpacity(0.4),
                        showValueIndicator: ShowValueIndicator.always,
                        overlayColor: kAppDefaultColor.withOpacity(0.5),
                      ),
                      child: RangeSlider(
                        values: _values,
                        labels: labels,
                        onChanged: (rangeValue) {
                          _values = rangeValue;
                          labels = RangeLabels("${_values.start.floor()}\$",
                              "${_values.end.floor()}\$");
                          setState(() {});
                        },
                        min: 0,
                        max: 10000,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //                   //   height: 20,
                  //                   // ),
                  SectionCustom(
                    title: 'Size team',
                    spaceHeaderContent: 4,
                    titleStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    paddingTitle: const EdgeInsets.symmetric(
                        horizontal: kPaddingHorizonApp),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kPaddingHorizonApp),
                      child: GroupButton(
                        onSelected: (index, isSelected) {},
                        isRadio: true,
                        unselectedTextStyle: TextStyle(color: kAppDefaultColor),
                        spacing: 5,
                        buttons: sizeTeamItem.map((e) => e.title).toList(),
                        selectedColor: kAppDefaultColor,
                        unselectedBorderColor: kAppDefaultColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SectionCustom(
                    title: 'Rating',
                    paddingTitle:
                        EdgeInsets.symmetric(horizontal: kPaddingHorizonApp),
                    titleStyle: kTitleFilterStyle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RatingBar.builder(
                        itemSize: 30,
                        initialRating: rating,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                        onRatingUpdate: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: widget.onPressed,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              child: Text('Apply Filter'),
              textColor: Colors.white,
              color: kAppDefaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            )
          ],
        ),
      ),
    );
  }
}
