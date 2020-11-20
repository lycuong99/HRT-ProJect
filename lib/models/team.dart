import 'package:hire_remote_team/models/feedback.dart';
import 'package:hire_remote_team/models/filter.dart';
import 'package:hire_remote_team/models/member.dart';
import 'package:hire_remote_team/models/skill.dart';

class TeamListModel {
  List<Team> _results;

  List<Team> get results => _results;

  TeamListModel.fromJson(dynamic parsedJson) {
    if (parsedJson == null) return;
    _results = [];
    for (int i = 0; i < parsedJson.length; i++) {
      Team team = Team.fromJson(parsedJson[i]);
      _results.add(team);
    }
  }
}

class Team {
  String _id;
  String _name;
  String _description;
  String _leaderId;
  String _avatarUrl;
  double _salarySuggest;
  double _averageRating;
  List<FeedBack> _feedbacks;
  List<Member> _members;
  List<Skill> _skills;
  int _totalMember;

  getExampleFeedback() {
    // FeedBack b = FeedBack.init('9990F694-08ED-418F-9DD6-C661D3951395',
    //     'Thank You', rate, teamId, cusId, cusName);
  }

  Team.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson[TeamConst.ID];
    _name = parsedJson[TeamConst.NAME];
    _description = parsedJson[TeamConst.DESCRIPTION];
    _leaderId = parsedJson[TeamConst.LEADER_ID];
    _salarySuggest =
        double.parse(parsedJson[TeamConst.SALARY_SUGGEST]?.toString() ?? '0');
    _averageRating =
        double.parse(parsedJson[TeamConst.AVERAGE_RATING]?.toString() ?? '0');
    _totalMember = parsedJson[TeamConst.TOTAL_MEMBER];
    print(parsedJson[TeamConst.TOTAL_MEMBER]);

    //Get Feedbacks
    if (parsedJson[TeamConst.FEED_BACK] != null) {
      List<FeedBack> tempFeedBack = [];
      // for (int i = 0; i < parsedJson[TeamConst.FEED_BACK].length; i++) {
      //       //   FeedBack result = FeedBack(parsedJson[TeamConst.FEED_BACK][i]);
      //       //   tempFeedBack.add(result);
      //       // }

    }
    _feedbacks = FeedbackInitData().getInitDataFeedBack();
    print('Feedback${_feedbacks.length}');
    if (parsedJson[TeamConst.MEMBER] != null) {
      List<Member> tempMember = [];
      for (int i = 0; i < parsedJson[TeamConst.MEMBER].length; i++) {
        Member result = Member(parsedJson[TeamConst.MEMBER][i]);
        tempMember.add(result);
      }
      _members = tempMember;
    }
    if (parsedJson[TeamConst.SKILLS] != null) {
      List<Skill> tempSkills = [];
      for (int i = 0; i < parsedJson[TeamConst.SKILLS].length; i++) {
        Skill result = Skill.fromJson(parsedJson[TeamConst.SKILLS][i]);
        tempSkills.add(result);
      }
      _skills = tempSkills;
    }
  }

  double get salarySuggest => _salarySuggest;
  double get averageRating => _averageRating;
  String get avatarUrl => _avatarUrl;
  String get leaderId => _leaderId;
  String get description => _description;

  String get name => _name;

  String get id => _id;

  List<Skill> get skills => _skills;

  List<Member> get members => _members;

  List<FeedBack> get feedbacks => _feedbacks;

  int get totalMemebr => _totalMember;
}

class TeamConst {
  static const ID = 'id';
  static const NAME = 'name';
  static const DESCRIPTION = 'description';
  static const SALARY_SUGGEST = 'salarySuggest';
  static const DATE_CREATED = 'dateCreated';
  static const LEADER_ID = 'leaderId';
  static const URL_GET_RECOMMEND =
      'https://hireremoteteam.azurewebsites.net/api/Team/Recommend?pageNo=1&itemPerPage=10';
  static const URL_SEARCH_FILTER =
      'https://hireremoteteam.azurewebsites.net/api/Team/SearchFillter';
  static const FEED_BACK = 'feedBack';
  static const AVERAGE_RATING = 'totalRating';
  static const MEMBER = 'member';
  static const TOTAL_MEMBER = 'totalMember';
  static const SKILLS = 'skills';
  // static String URL_Team s =

  static String getURLTeamProfile(String teamId) {
    return 'https://hireremoteteam.azurewebsites.net/api/Team/$teamId';
  }

//   static String getURLSearch(String key, FilterObj filterObj, Sort sort) {
//     return 'https://hireremoteteam.azurewebsites.net/api/Team/$teamId';
//   }
}
