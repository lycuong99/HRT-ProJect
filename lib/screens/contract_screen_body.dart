import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hire_remote_team/blocs/contract_bloc.dart';
import 'package:hire_remote_team/components/contract_card.dart';
import 'package:hire_remote_team/components/tab_custom.dart';
import 'package:hire_remote_team/models/contract.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

import 'package:line_icons/line_icons.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final ContractBloc contractBloc = ContractBloc();

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
        length: 3,
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
                    TabCustom01(title: 'WAITING'),
                    TabCustom01(title: 'IN PROCESS'),
                    TabCustom01(title: 'HISTORY')
                  ]),
            ),
            Expanded(
                child: StreamBuilder<ContractListModel>(
              stream: contractBloc.contractStream,
              builder: (context, AsyncSnapshot<ContractListModel> snapshot) {
                if (snapshot.hasData) {
                  List<Contract> contracts = snapshot.data.results;
                  List<Contract> waitingContract = [];
                  List<Contract> confirmContract = [];
                  List<Contract> pastContract = [];
                  for (int i = 0; i < contracts.length; i++) {
                    Contract contract = contracts[i];
                    if (contract.status == StatusContract.WAITING) {
                      waitingContract.add(contract);
                    } else if (contract.status == StatusContract.CONFIRM) {
                      confirmContract.add(contract);
                    } else if (contract.status == StatusContract.COMPLETE ||
                        contract.status == StatusContract.CANCELED) {
                      pastContract.add(contract);
                    }
                  }

                  return TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: waitingContract.length,
                        itemBuilder: (context, index) {
                          return ContractCard(contract: waitingContract[index]);
                        },
                      ),
                      ListView.builder(
                        itemCount: confirmContract.length,
                        itemBuilder: (context, index) {
                          return ContractCard(contract: confirmContract[index]);
                        },
                      ),
                      ListView.builder(
                        itemCount: pastContract.length,
                        itemBuilder: (context, index) {
                          return ContractCard(contract: pastContract[index]);
                        },
                      ),
                    ],
                  );
                } else {
                  return TabBarView(
                      children: [Container(), Container(), Container()]);
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
