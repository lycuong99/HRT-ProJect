class Skill {
  String _name;
  String _id;

  Skill.fromJson(jsonParsed) {
    _name = jsonParsed[SkillConst.NAME];
    _id = jsonParsed[SkillConst.ID];
  }

  @override
  String toString() {
    return '$_id';
  }

  Skill.getExample(int i) {
    _name = 'Skill $i';
    _id = 'Id_Skill $i';
  }

  String get id => _id;
  String get name => _name;
}

class SkillConst {
  static const NAME = 'name';
  static const ID = 'id';
  static const GET_ALL_SKILLS =
      'https://hireremoteteam.azurewebsites.net/api/Skill/Allnonpaging';
}
