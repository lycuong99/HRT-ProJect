import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:hire_remote_team/components/section_custom.dart';
import 'package:hire_remote_team/providers/firebase_auth.dart';
import 'package:hire_remote_team/ultilites/constants.dart';

final Color indicatorColor = const Color(0xFF1AC4C7);
final Color monthCellBackground = const Color(0xffF7F4FF);

class CreateContractScreen extends StatefulWidget {
  static const id = 'create_contract_screen';
  @override
  _CreateContractScreenState createState() => _CreateContractScreenState();
}

class _CreateContractScreenState extends State<CreateContractScreen> {
  int _selectedIndex = 0;
  Widget customizeCalendarPicker;

  TextEditingController _title = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _note = TextEditingController();

  Color iconColor = Colors.white;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email.text = AuthProvider().getCurrentUser().email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Create Contract',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            Container(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: SectionCustom(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          boxDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11)),
                          title: 'Title Contract',
                          // paddingTitle: EdgeInsets.symmetric(vertical: 15),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: TextFormField(
                              controller: _title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              decoration: kInputDecoration.copyWith(
                                  prefixIcon: Icon(
                                    Icons.drive_file_rename_outline,
                                    size: 20,
                                    color: kAppDefaultColor,
                                  ),
                                  hintText: 'Enter name of contract',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                          )),
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(10),
                    //   child: SectionCustom(
                    //       padding: EdgeInsets.symmetric(
                    //         vertical: 15,
                    //       ),
                    //       boxDecoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(11)),
                    //       title: 'Phone',
                    //       // paddingTitle: EdgeInsets.symmetric(vertical: 15),
                    //       child: Padding(
                    //         padding: EdgeInsets.only(left: 15, right: 15),
                    //         child: TextFormField(
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold),
                    //           decoration: kInputDecoration.copyWith(
                    //               prefixIcon: Icon(
                    //                 FontAwesomeIcons.phone,
                    //                 size: 20,
                    //                 color: kAppDefaultColor,
                    //               ),
                    //               hintText: 'Enter your phone number',
                    //               hintStyle: TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.w400)),
                    //         ),
                    //       )),
                    // ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: SectionCustom(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          boxDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11)),
                          title: 'Email Contact',
                          // paddingTitle: EdgeInsets.symmetric(vertical: 15),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: TextFormField(
                              controller: _email,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              decoration: kInputDecoration.copyWith(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 20,
                                    color: kAppDefaultColor,
                                  ),
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                          )),
                    ),
                    SectionCustom(
                      title: 'Notes about contract',
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      boxDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11)),
                      child: TextField(
                        maxLines: 5,
                        controller: _note,
                        minLines: 2,
                        decoration: kInputDecoration.copyWith(
                            contentPadding: EdgeInsets.symmetric(vertical: 18),
                            prefixIcon: Icon(
                              Icons.rate_review,
                              color: kGreyColor,
                            ),
                            hintText: '',
                            hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: MaterialButton(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Color(0xfffafafa),
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        onPressed: () {},
                        minWidth: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 0),
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31)),
                        color: kAppDefaultColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MaterialButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 0),
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31)),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
