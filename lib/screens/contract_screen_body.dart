import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_remote_team/blocs/contract_bloc.dart';
import 'package:hire_remote_team/components/tab_custom.dart';
import 'package:hire_remote_team/models/contract.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

import 'package:line_icons/line_icons.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  ContractBloc contractBloc = ContractBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contractBloc.fetchExamples();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF4F4F4),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 37,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                  unselectedLabelColor: Color(0xff5768FF),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kAppDefaultColor),
                  labelColor: Colors.white,
                  indicatorPadding: EdgeInsets.all(0),
                  labelPadding: EdgeInsets.all(0),
                  tabs: [
                    TabCustom01(title: 'Upcomings'),
                    TabCustom01(title: 'History')
                  ]),
            ),
            Expanded(
                child: StreamBuilder(
              stream: contractBloc.contractStream,
              builder: (context, AsyncSnapshot<ContractListModel> snapshot) {
                if (snapshot.hasData) {
                  snapshot.data.results;

                  return TabBarView(children: [ListView(), Container()]);
                } else {
                  return TabBarView(children: [Container(), Container()]);
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
