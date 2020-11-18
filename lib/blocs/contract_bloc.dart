import 'package:hire_remote_team/models/contract.dart';
import 'package:hire_remote_team/repositories/contract_repo.dart';
import 'package:rxdart/rxdart.dart';

class ContractBloc {
  final _repository = ContractRepo();
  final _teamFetcher = PublishSubject<ContractListModel>();

  Stream<ContractListModel> get contractStream => _teamFetcher.stream;

  fetchExamples() async {
    ContractListModel itemModel = await _repository.getExampleContracs();
    _teamFetcher.sink.add(itemModel);
  }

  dispose() {
    _teamFetcher.close();
  }
}
