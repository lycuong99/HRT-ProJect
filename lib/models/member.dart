class Member {
  String _id;
  String _name;
  String _avatar;
  double _experience;
  String _description;
  String _teamId;
  String _role;

  Member(parsedJson) {
    _name = parsedJson[MemberConst.NAME];
    _role = parsedJson[MemberConst.ROLE];
  }

  String get role => _role;

  String get teamId => _teamId;

  String get description => _description;

  double get experience => _experience;

  String get avatar => _avatar;

  String get name => _name;

  String get id => _id;
}

class MemberConst {
  static const NAME = 'name';
  static const ROLE = 'role';
}
