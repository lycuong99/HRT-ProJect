class FeedbackInitData {
  List<String> _teamIdEx = [
    "9990F694-08ED-418F-9DD6-C661D3951393",
    "9990F694-08ED-418F-9DD6-C661D3951394",
    "9990F694-08ED-418F-9DD6-C661D3951395",
    "9990F694-08ED-418F-9DD6-C661D3951396",
    "9990F694-08ED-418F-9DD6-C661D3951397",
    "9990F694-08ED-418F-9DD6-C661D3951398",
    "9990F694-08ED-418F-9DD6-C661D3951399",
    "9990F694-08ED-418F-9DD6-C661D3951400",
    "9990F694-08ED-418F-9DD6-C661D3951401",
    "9990F694-08ED-418F-9DD6-C661D3951402",
    "9990F694-08ED-418F-9DD6-C661D3951403",
    "9990F694-08ED-418F-9DD6-C661D3951404",
    "9990F694-08ED-418F-9DD6-C661D3951405",
    "9990F694-08ED-418F-9DD6-C661D3951406",
    "9990F694-08ED-418F-9DD6-C661D3951407",
    "9990F694-08ED-418F-9DD6-C661D3951408",
    "9990F694-08ED-418F-9DD6-C661D3951409",
    "9990F694-08ED-418F-9DD6-C661D3951410",
    "9990F694-08ED-418F-9DD6-C661D3951411",
    "9990F694-08ED-418F-9DD6-C661D3951412",
  ];

  List<String> _nameLst = [
    "CusTomer1",
    "CusTomer2",
    "CusTomer3",
    "CusTomer4",
    "CusTomer5",
    "CusTomer6",
    "CusTomer7",
    "CusTomer8",
    "CusTomer9",
    "CusTomer10",
    "CusTomer11",
    "CusTomer12",
    "CusTomer13",
    "CusTomer14",
    "CusTomer15",
    "CusTomer16",
    "CusTomer17",
    "CusTomer18",
    "CusTomer19",
    "CusTomer20",
  ];
  List<String> descriptions = [
    "Thank You ",
    "So good",
    "This team is Ok",
    "Thank You ",
    "So good",
    "This team is Ok",
    "Thank You ",
    "So good",
    "This team is Ok",
    "Thank You ",
    "So good",
    "This team is Ok",
    "Thank You ",
    "So good",
    "This team is Ok",
    "Thank You ",
    "So good",
    "This team is Ok",
    "Thank You ",
    "So good",
  ];
  List<String> createDates = [
    "20/10/2020",
    "21/1/2019",
    "20/10/2021",
    "21/1/2020",
    "20/10/2022",
    "21/1/2021",
    "20/10/2023",
    "21/1/2022",
    "20/10/2024",
    "21/1/2023",
    "20/10/2025",
    "21/1/2024",
    "20/10/2026",
    "21/1/2025",
    "20/10/2027",
    "21/1/2026",
    "20/10/2028",
    "21/1/2027",
    "20/10/2029",
    "21/1/2028",
  ];
  List<double> rates = [
    4,
    5,
    2,
    3,
    3,
    3,
    3,
    4,
    5,
    5,
    3,
    5,
    5,
    2,
    5,
    5,
    4,
    2,
    5,
    5,
  ];
  List<FeedBack> getInitDataFeedBack() {
    List<FeedBack> feedInit = [];
    for (int i = 0; i < 10; i++) {
      FeedBack f = FeedBack.init(_teamIdEx[i], descriptions[i], rates[i], "",
          "cusId", _nameLst[i], createDates[i]);
      feedInit.add(f);
    }
    return feedInit;
  }
}

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

  FeedBack.init(String id, String content, double rate, String teamId,
      String cusId, String cusName, String dateCreate) {
    _id = id;
    _content = content;
    _rate = rate;
    _teamId = teamId;
    _customerId = cusId;
    _customerName = cusName;
    _dateCreate = dateCreate;
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
