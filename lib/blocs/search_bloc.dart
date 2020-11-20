import 'dart:async';

import 'package:hire_remote_team/models/filter.dart';
import 'package:hire_remote_team/models/team.dart';
import 'package:hire_remote_team/repositories/team_repo.dart';
import 'package:rxdart/rxdart.dart';

class SearchTeamsBloc {
  FilterObj filterObj;
  Sort sortBy;
  final _repository = TeamRepo();
  // ignore: close_sinks
  final _teamFetcher = StreamController<TeamListModel>.broadcast();

  Stream<TeamListModel> get stream => _teamFetcher.stream;

  fetchResultSearch(String key, FilterObj filterObj, Sort sortBy) async {
    TeamListModel itemModel = await _repository.search(key, filterObj, sortBy);
    print('IteamModel IN SEARCH:+${itemModel?.results?.length}');
    _teamFetcher.sink.add(itemModel);
  }
}
