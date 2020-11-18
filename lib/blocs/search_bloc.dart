import 'package:hire_remote_team/models/filter.dart';
import 'package:hire_remote_team/models/team.dart';
import 'package:hire_remote_team/repositories/team_repo.dart';
import 'package:rxdart/rxdart.dart';

class SearchTeamsBloc {
  FilterObj filterObj;
  Sort sortBy;
  final _repository = TeamRepo();
  // ignore: close_sinks
  final _teamFetcher = PublishSubject<TeamListModel>();

  Stream<TeamListModel> get stream => _teamFetcher.stream;

  fetchResultSearch(String key, FilterObj filterObj, Sort sortBy) async {
    TeamListModel itemModel = await _repository.search(key, filterObj);
    _teamFetcher.sink.add(itemModel);
  }
}
