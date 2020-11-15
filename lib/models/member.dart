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
}

class MemberConst {
  static const NAME = 'name';
  static const ROLE = 'role';
}
