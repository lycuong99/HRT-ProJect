import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/screens/welcome_screen.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/avatar_1.png"),
            ),
          ),
          Text(
            'Thanh Tu',
            style: kTitleCard.copyWith(color: kAppDefaultColor, fontSize: 23),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleButton(
                title: "Profile Setting",
                icon: Icon(Icons.person_outline, color: kAppDefaultColor),
              ),
              TitleButton(
                  title: "Payment",
                  icon: Icon(Icons.payment, color: kAppDefaultColor)),
              TitleButton(
                  title: "Help & FAQ",
                  icon: Icon(Icons.help_outline, color: kAppDefaultColor)),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  // Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                padding: EdgeInsets.symmetric(vertical: 15),
                height: 50,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(11)),
                color: Colors.white,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Text(
              //       'Logout',
              //       style: TextStyle(
              //           fontWeight: FontWeight.w600,
              //           fontSize: 15,
              //           color: kBlackFontCollor_1),
              //     ),
              //     padding: EdgeInsets.only(top: 25, bottom: 10),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String title;
  final Icon icon;

  TitleButton({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black.withOpacity(0.1), width: 0.5))),
      child: MaterialButton(
        elevation: 5,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 14, bottom: 13),
          child: Container(
            child: ListTile(
              title: Align(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                alignment: Alignment(-1.2, 0),
              ),
              leading: icon,
              trailing: Icon(Icons.chevron_right, color: Color(0xffadadad)),
              contentPadding: EdgeInsets.only(left: 0, top: 0),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
            ),
          ),
        ),
      ),
    );
  }
}
