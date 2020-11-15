import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/blocs/team_bloc.dart';
import 'package:hire_remote_team/components/circle_menu_item.dart';
import 'package:hire_remote_team/components/search_component.dart';
import 'package:hire_remote_team/components/section_custom.dart';
import 'package:hire_remote_team/components/team_card.dart';
import 'package:hire_remote_team/models/team.dart';
import 'package:hire_remote_team/screens/search_screen.dart';

import 'package:hire_remote_team/screens/team_profile_screen.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  List<Team> recommendTeams;

  @override
  void initState() {
    recommendTeamsBloc.fetchRecommendTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
    recommendTeamsBloc.fetchRecommendTeams();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 60,
              margin: EdgeInsets.only(bottom: kDistanceComponentApp),
              padding: EdgeInsets.symmetric(
                  horizontal: kPaddingHorizonApp, vertical: 10),
              child: SearchNavigator()),
          SectionCustom(
            title: 'What are you looking for?',
            paddingTitle:
                const EdgeInsets.symmetric(horizontal: kPaddingHorizonApp),
            child: Container(
              height: 100,
              child: Material(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 10.0,
                  cacheExtent: 2,
                  children: [
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/web_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/android_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/ios_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/ios_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/web_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/android_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/ios_icon.png',
                        )),
                    CircleMenuItem(
                        title: 'Web',
                        img: AssetImage(
                          'images/ios_icon.png',
                        )),
                  ],
                ),
              ),
            ),
          ),
          SectionCustom(
            title: "Team For you",
            paddingTitle:
                const EdgeInsets.symmetric(horizontal: kPaddingHorizonApp),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.28,
              child: StreamBuilder<TeamListModel>(
                  stream: recommendTeamsBloc.stream,
                  builder: (context, AsyncSnapshot<TeamListModel> snapshot) {
                    if (snapshot.hasData) {
                      return buildRecommendTeam(snapshot);
                    } else {
                      return Center(child: Text('No recode'));
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRecommendTeam(AsyncSnapshot<TeamListModel> snapshot) {
    List<Team> recommendTeams = snapshot.data.results;

    return ListView.builder(
        primary: true,
        shrinkWrap: false,
        padding: EdgeInsets.all(1),
        scrollDirection: Axis.horizontal,
        itemCount: recommendTeams.length ?? 0,
        itemBuilder: (context, index) {
          double paddingLeft = 10;
          if (index == 0) {
            paddingLeft = kPaddingHorizonApp;
          }
          Team team = recommendTeams[index];
          return VerticalTeamCard(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return TeamProfileScreen(
                    idTeam: team.id,
                  );
                },
              ));
            },
            paddingLeft: paddingLeft,
            address: team.salarySuggest.toString(),
            img: Image(
              image: AssetImage('images/job_1.jpg'),
              fit: BoxFit.cover,
            ),
            name: team.name,
            totalMember: team.totalMemebr,
          );
        });
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        showSearch(context: context, delegate: SearchAppBarDelegate());
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return SearchScreen();
        //   },
        // ));
      },
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: "Search Freelances or Jobs",
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.all(10.0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: Container(
          decoration: BoxDecoration(
            color: Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        fillColor: Color(0xffE5E5E5),
        filled: true,
      ),
    );
  }
}
