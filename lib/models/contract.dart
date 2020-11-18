import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hire_remote_team/ultilites/local_assets_helper.dart';

class ContractListModel {
  List<Contract> _results;
  List<Contract> get results => _results;

  ContractListModel.fromJson(dynamic parsedJson) {
    _results = [];
    for (int i = 0; i < parsedJson.length; i++) {
      Contract contract = Contract.fromJson(parsedJson[i]);
      _results.add(contract);
    }
  }
}

class Contract {
  String _id;
  String _name;
  String _statusId;
  StatusContract _status;
  String _customerId;
  String _teamId;
  String _description;
  String _dateCreated;
  String _infoContact;

  Contract.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson == null) return;
    _id = parsedJson[ContractConst.ID];
    _name = parsedJson[ContractConst.NAME];
    _statusId = parsedJson[ContractConst.STATUS_ID];
    _customerId = parsedJson[ContractConst.CUSTOMER_ID];
    _teamId = parsedJson[ContractConst.TEAM_ID];
    _description = parsedJson[ContractConst.DESCRIPTION];
    _infoContact = parsedJson[ContractConst.INFO_CONTACT];
    _dateCreated = parsedJson[ContractConst.DATE_CREATED];
  }

  String get infoContact => _infoContact;

  String get dateCreated => _dateCreated;

  String get description => _description;

  String get teamId => _teamId;

  String get customerId => _customerId;

  StatusContract get status {
    switch (_statusId) {
      case 'waiting':
        return StatusContract.WAITING;
      case 'completed':
        return StatusContract.COMPLETE;
      case 'confirmed':
        return StatusContract.CONFIRM;
      case 'canceled':
        return StatusContract.CANCELED;
      default:
        return StatusContract.NOT_YET;
    }
  }

  String get statusId => _statusId;

  String get name => _name;

  String get id => _id;
}

enum StatusContract { WAITING, CANCELED, COMPLETE, CONFIRM, NOT_YET }

class ContractConst {
  static const ID = 'id';
  static const NAME = 'name';
  static const DESCRIPTION = 'description';
  static const INFO_CONTACT = 'infoContact';
  static const STATUS_ID = 'status_id';
  static const CUSTOMER_ID = 'customerId';
  static const DATE_CREATED = 'dateCreated';
  static const TEAM_ID = 'teamId';
  static const LEADER_ID = 'leaderId';
  static const URL_GET_ALL =
      'https://hireremoteteam.azurewebsites.net/api/Team/Recommend?pageNo=1&itemPerPage=3';
  static const LOCAL_GET_EXAMPLES = '';

  static String getURLTeamProfile(String teamId) {
    return 'https://hireremoteteam.azurewebsites.net/api/Team/$teamId';
  }
}
