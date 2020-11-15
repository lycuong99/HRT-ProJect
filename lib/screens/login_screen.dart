import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/components/button.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: 1100,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/login_bgrd_1.jpg"),
              fit: BoxFit.cover,
            )),
            constraints: BoxConstraints.expand(),
          ),
          Positioned(
            child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: AppBar(
                  leading: GestureDetector(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text("Transparent AppBar"),
                  backgroundColor: Colors.transparent,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            padding: EdgeInsets.all(40),
            height: 490,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    topLeft: Radius.circular(55))),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        size: 20,
                        color: Colors.black,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      counterText: 'Forgot Password?',
                      counterStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                        color: Colors.black,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  RoundButtonFullWidth(
                    color: Colors.black,
                    fontColor: Colors.white,
                    text: 'Log In',
                    onPressed: () {},
                  ),
                  RoundButtonFullWidth(
                    color: Colors.black,
                    fontColor: Colors.white,
                    text: 'Log In like Photographer',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
