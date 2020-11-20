import 'package:hire_remote_team/models/contract.dart';
import 'package:hire_remote_team/providers/contract_service.dart';

class ContractRepo {
  final ContractService service = ContractService();

  Future<ContractListModel> getExampleContracs() async =>
      service.getExampleContract();
}
