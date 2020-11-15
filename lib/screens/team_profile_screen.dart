import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hire_remote_team/blocs/team_bloc.dart';
import 'package:hire_remote_team/components/bottom_bar.dart';
import 'package:hire_remote_team/components/review.dart';
import 'package:hire_remote_team/components/review_card.dart';
import 'package:hire_remote_team/components/section_custom.dart';
import 'package:hire_remote_team/components/skill_tag.dart';
import 'package:hire_remote_team/models/skill.dart';

import 'package:hire_remote_team/models/team.dart';
import 'package:hire_remote_team/screens/home_screen.dart';

import 'package:hire_remote_team/ultilites/constants.dart';

List<Container> _buildGridAlbumList(int count) {
  //generate list images
  return List<Container>.generate(
      count,
      (int index) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/album${index + 1}.jpg',
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 4, //spread radius
                    blurRadius: 5, // blur radius
                    offset: Offset(0, 4), // changes po
                  )
                ]),
          ));
}

Widget buildGrid() {
  return GridView.count(
      scrollDirection: Axis.vertical,
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      crossAxisCount: 2,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      children: _buildGridAlbumList(4));
}

class TeamProfileScreen extends StatefulWidget {
  String idTeam;
  TeamProfileScreen({@required this.idTeam});
  @override
  _TeamProfileScreenState createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
  String teamId;
  String description;

  String imgUrl = 'images/teambg.png';
  final teamBloc = TeamBloc();

  @override
  void initState() {
    teamId = widget.idTeam;

    teamBloc.fetchTeam(teamId);
    super.initState();
    // getTeamInfo();
  }

  @override
  void dispose() {
    teamBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomBarButton(
          right: 'HIRE',
          rightOnPressed: () {},
          left: Icon(
            Icons.message,
            size: 30,
            color: kAppDefaultColor,
          ),
          leftOnPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: StreamBuilder(
          stream: teamBloc.team,
          builder: (context, AsyncSnapshot<Team> snapshot) {
            if (snapshot.hasData) {
              return buildScreen(snapshot);
            } else {
              return Center(
                child: SpinKitDoubleBounce(
                  size: 100.0,
                  color: Colors.black12,
                ),
              );
            }
          },
        ));
  }

  Widget buildScreen(AsyncSnapshot<Team> snapshot) {
    Team team = snapshot.data;
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: 330,
            backgroundColor: Colors.white,
            elevation: 3,
            primary: true,
            title: Text('Profile',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                )),
            flexibleSpace: Stack(children: [
              FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                background: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(imgUrl),
                ),
              ),
              Positioned(
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                ),
                bottom: -1,
                left: 0,
                right: 0,
              ),
            ]),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: kPaddingHorizonApp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(team.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )),
                    RatingBar.builder(
                        itemCount: 5,
                        minRating: 1,
                        initialRating: 4,
                        itemSize: 25,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        })
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: kPaddingHorizonApp, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Align(
                        child: Text(
                          "5 years",
                          style: kContentCard,
                        ),
                        alignment: Alignment(-1.1, 0),
                      ),
                      leading: Text(
                        'Exp',
                        style: TextStyle(color: Color(0xffadadad)),
                      ),
                      contentPadding: EdgeInsets.only(left: 0, top: 0),
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                    ),
                    ListTile(
                      title: Align(
                        child: Text(
                          "(+84) 123-456-789",
                          style: kContentCard,
                        ),
                        alignment: Alignment(-1.2, 0),
                      ),
                      leading: Icon(Icons.phone, color: Color(0xffadadad)),
                      contentPadding: EdgeInsets.only(left: 0, top: 0),
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                    ),
                    ListTile(
                      dense: true,
                      title: Align(
                        child: Text(
                          "thanhtu@gmail.com",
                          style: kContentCard,
                        ),
                        alignment: Alignment(-1.2, 0),
                      ),
                      leading: Icon(
                        Icons.mail_outline,
                        color: Color(0xffadadad),
                        size: 25,
                      ),
                      contentPadding: EdgeInsets.only(left: 0),
                      visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                    ),
                    ListTile(
                      title: Align(
                        child: Text(
                          "1000/1h",
                          style: kContentCard,
                        ),
                        alignment: Alignment(-1.1, 0),
                      ),
                      leading:
                          Icon(Icons.attach_money, color: Color(0xffadadad)),
                      contentPadding: EdgeInsets.only(left: 0, top: 0),
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: kPaddingHorizonApp),
                child: Text(
                  'I love the people I photograph. I mean, they’re my friends. I’ve never met most of them or I don’t know them at all, yet through my images I live with them.',
                  style: kContentCard,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SectionCustom(
                title: 'Skills',
                child: Padding(
                  padding: EdgeInsets.only(
                      left: kPaddingHorizonApp, right: kPaddingHorizonApp),
                  child: GroupSkillTag(
                    tags: team.skills,
                    backgroundColor: kAppDefaultColor.withAlpha(210),
                    onTap: (i) {},
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SectionCustom(
                title: 'Reviews',
                paddingTitle: EdgeInsets.only(left: kPaddingHorizonApp),
                child: ListView(
                  padding: EdgeInsets.only(top: 0),
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    ReviewCard(
                      rating: 4,
                      comment: 'Thanks for bring for me a beautiful albums',
                      date: '20/01/2020',
                      imgProfileURL: 'images/avatar_2.jpg',
                      rator: 'Huyen My',
                    ),
                    ReviewCard(
                      rating: 5,
                      comment: 'Thanks for bring for me a beautiful albums',
                      date: '21/04/2020',
                      imgProfileURL: 'images/p2.jpg',
                      rator: 'Tri Nguyen',
                    ),
                    ReviewCard(
                      rating: 4,
                      comment: 'He is so kind',
                      date: '12/05/2020',
                      imgProfileURL: 'images/avatar_3.jpg',
                      rator: 'Nguyen Thi Quynh',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
