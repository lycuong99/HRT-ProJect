import 'package:hire_remote_team/models/team.dart';
import 'package:hire_remote_team/repositories/team_repo.dart';
import 'package:rxdart/rxdart.dart';

class TeamBloc {
  final _repository = TeamRepo();
  final _teamFetcher = PublishSubject<Team>();

  Stream<Team> get team => _teamFetcher.stream;

  fetchTeam(teamId) async {
    Team itemModel = await _repository.getTeam(teamId);
    _teamFetcher.sink.add(itemModel);
  }

  dispose() {
    _teamFetcher.close();
  }
}

class RecommendTeamsBloc {
  final _repository = TeamRepo();
  final _teamFetcher = PublishSubject<TeamListModel>();

  Stream<TeamListModel> get stream => _teamFetcher.stream;

  fetchRecommendTeams() async {
    TeamListModel itemModel = await _repository.getRecommendTeams();
    _teamFetcher.sink.add(itemModel);
  }
}

final RecommendTeamsBloc recommendTeamsBloc = RecommendTeamsBloc();
