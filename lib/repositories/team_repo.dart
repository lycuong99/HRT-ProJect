import 'package:hire_remote_team/models/filter.dart';
import 'package:hire_remote_team/models/skill.dart';
import 'package:hire_remote_team/models/team.dart';
import 'package:hire_remote_team/providers/team_service.dart';

class TeamRepo {
  final TeamService service = TeamService();
  Future<Team> getTeam(teamId) => service.getTeam(teamId);
  Future<TeamListModel> getRecommendTeams() => service.getRecommendTeams();
  Future<TeamListModel> search(String key, FilterObj filterObj) {
    return service.getRecommendTeams();
  }

  //
  // List<Team> getExampleList() {
  //   Team t1 = Team(
  //       name: "Google",
  //       description:
  //           "Design your app, choose from a huge range of features and you will have a fully functional Team App created in less than 10 minutes.",
  //       id: "1",
  //       leaderId: "1");
  //   Team t2 = Team(
  //       name: "Facebook",
  //       description:
  //           "Members details and email addresses can be imported in bulk and automatically assigned an access group. Parents can also be aligned to children!",
  //       id: "2",
  //       leaderId: "2");
  //
  //   Team t3 = Team(
  //       name: "Apple",
  //       description:
  //           'Assign members to submit votes for best players. Select opening and closing times. Voters will receive push notifications reminders to vote.',
  //       id: "3",
  //       leaderId: "3");
  //
  //   List<Team> teams = [t1, t2, t3];
  //
  //   return teams;
  // }
}
