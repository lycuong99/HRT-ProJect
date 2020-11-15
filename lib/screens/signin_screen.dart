import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/components/button.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'sign_in';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/login_bgrd_1.jpg"),
              fit: BoxFit.cover,
            )),
            constraints: BoxConstraints.expand(),
          ),
          Positioned(
              child: AppBar(
            elevation: 0,
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
            title: Text("Transparent AppBar 1"),
            backgroundColor: Colors.transparent,
          )),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: 250),
              padding: EdgeInsets.all(40),
              height: 490,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(55),
                      topLeft: Radius.circular(55))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
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
                      counterStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.black,
                      ),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
//
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
                    height: 36,
                  ),
                  RoundButtonFullWidth(
                    color: Colors.black,
                    fontColor: Colors.white,
                    text: 'Log In',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignInScreen();
                      }));
                    },
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
