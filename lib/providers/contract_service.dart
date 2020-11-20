import 'package:hire_remote_team/models/contract.dart';
import 'package:hire_remote_team/providers/networking.dart';
import 'package:hire_remote_team/ultilites/local_assets_helper.dart';

class ContractService {
  NetWorkHelper _netWorkHelper;

  void createContract(Contract contract) {
    NetWorkHelper netWorkHelper = NetWorkHelper(url: '');
    var data = netWorkHelper.postData(contract, null);
  }

  Future<ContractListModel> getAllContract(customerId) async {
    String url = ContractConst.URL_GET_ALL;
    _netWorkHelper = NetWorkHelper(url: url);
    var contracts = await _netWorkHelper.getData();
    print(contracts);
    ContractListModel contractListModel = ContractListModel.fromJson(contracts);
    return contractListModel;
  }

  Future<ContractListModel> getExampleContract() async {
    final data = await LocalAssetsHelper.getDataFromAssets(
        'assets/contracts_example.json');
    print('EXAMPLE - DATE:');
    print(data);
    ContractListModel listModel = ContractListModel.fromJson(data);
    return listModel;
  }
}
