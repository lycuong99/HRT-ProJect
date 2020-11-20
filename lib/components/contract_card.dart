import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/components/card_tile_custom.dart';
import 'package:hire_remote_team/models/contract.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class ContractCard extends StatelessWidget {
  Widget statusWidget;

  final Contract contract;
  ContractCard({@required this.contract});

  getStatusWidget() {
    switch (contract.status) {
      case StatusContract.WAITING:
        return Text(
          '...waiting',
          style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.yellow,
              fontWeight: FontWeight.bold),
        );

      case StatusContract.CONFIRM:
        return Text(
          'confirmed',
          style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.blue,
              fontWeight: FontWeight.bold),
        );

      case StatusContract.COMPLETE:
        return Text(
          'completed',
          style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.green,
              fontWeight: FontWeight.bold),
        );

      case StatusContract.CANCELED:
        return Text(
          'canceled',
          style: TextStyle(
              letterSpacing: 0.4,
              color: Colors.red,
              fontWeight: FontWeight.bold),
        );
    }
  }

  static const kInfoColor = Color(0xffBFBEC6);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {},
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 140,
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(11)),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/job_1.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(11)),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      contract.name,
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    CardTile(
                      leading: Icon(
                        Icons.person_outline,
                        color: Color(0xffBFC4C7),
                        size: 18,
                      ),
                      title: Text(
                        contract.teamId,
                        style: TextStyle(color: kGreyColor, fontSize: 13),
                      ),
                    ),
                    CardTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Color(0xffBFC4C7),
                        size: 18,
                      ),
                      title: Text(
                        contract.description,
                        style: TextStyle(
                            color: kGreyColor, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      children: [
                        CardTile(
                          leading: Icon(
                            Icons.calendar_today,
                            color: Color(0xffBFC4C7),
                            size: 18,
                          ),
                          title: Text(
                            contract.statusId,
                            style: TextStyle(color: kGreyColor, fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CardTile(
                          leading: Icon(
                            Icons.timer_sharp,
                            color: Color(0xffBFC4C7),
                            size: 18,
                          ),
                          title: Text(
                            '2 hours',
                            style: TextStyle(color: kGreyColor),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          contract.dateCreated,
                          style: TextStyle(color: kGreyColor, fontSize: 13),
                        ),
                        getStatusWidget()
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
