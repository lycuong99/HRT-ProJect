import 'package:hire_remote_team/models/skill.dart';
import 'package:hire_remote_team/providers/networking.dart';

class DataFilter {
  NetWorkHelper _netWorkHelper;

  Future<List<Skill>> getSkills() async {
    String url = SkillConst.GET_ALL_SKILLS;
    _netWorkHelper = NetWorkHelper(url: url);

    dynamic skillsJson = await _netWorkHelper.getData();
    print("-- Get All Skill InFo: " + skillsJson.toString());
    List<Skill> skills = [];

    if (skillsJson != null) {
      for (int i = 0; i < skillsJson.length; i++) {
        Skill skill = Skill.fromJson(skillsJson[i]);
        skills.add(skill);
      }
    }
    return skills;
  }

  List<Skill> getExample() {
    List<Skill> skills = [];
    for (int i = 1; i < 5; i++) {
      skills.add(Skill.getExample(i));
    }
    return skills;
  }
}
