class FeedBack {
  String _id;
  String _content;
  double _rate;
  String _dateCreate;
  String _teamId;
  String _customerId;
  String _customerName;
  FeedBack(jsonFeedBack) {
    _id = jsonFeedBack[FeedBackConst.ID];
    _content = jsonFeedBack[FeedBackConst.CONTENT];
    _rate = jsonFeedBack[FeedBackConst.RATE];
    _dateCreate = jsonFeedBack[FeedBackConst.DATE_CREATE];
    _customerId = jsonFeedBack[FeedBackConst.CUSTOMER_ID];
    _customerName = jsonFeedBack[FeedBackConst.CUSTOMER_NAME];
  }

  String get customerName => _customerName;

  String get customerId => _customerId;

  String get teamId => _teamId;

  String get dateCreate => _dateCreate;

  double get rate => _rate;

  String get content => _content;

  String get id => _id;
}

class FeedBackConst {
  static const ID = 'id';
  static const CONTENT = 'content';
  static const RATE = 'RATE';
  static const DATE_CREATE = 'dateCreate';
  static const CUSTOMER_ID = 'customerId';
  static const CUSTOMER_NAME = 'customerName';
}
