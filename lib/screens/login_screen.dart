import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_remote_team/components/button.dart';
import 'package:hire_remote_team/providers/firebase_auth.dart';
import 'package:hire_remote_team/screens/home_screen.dart';
import 'package:hire_remote_team/screens/main_screen.dart';
import 'package:hire_remote_team/screens/welcome_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowModal = false;
  TextEditingController _emailInputController = TextEditingController();

  TextEditingController _passwordInputController = TextEditingController();

  int errorCode = 0;
  final _formKey = GlobalKey<FormState>();
  AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isShowModal,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 310,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/teambgvertical.jpg"),
                    fit: BoxFit.contain,
                  )),
                  constraints: BoxConstraints.expand(),
                ),
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
                title: Text(
                  "Register to app",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.transparent,
              )),
              Container(
                margin: EdgeInsets.only(top: 250),
                padding: EdgeInsets.all(40),
                height: 490,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(55),
                        topLeft: Radius.circular(55))),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
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
                        TextFormField(
                          controller: _emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (errorCode == 540662271) {
                              return 'The email address is badly formatted.';
                            }
                            if (errorCode == 246276089) {
                              return 'The email address is existed.';
                            }
                            return null;
                          },
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
                        TextFormField(
                          controller: _passwordInputController,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (errorCode == 328678433) {
                              return 'Password should be at least 6 characters';
                            }
                            if (errorCode == 218430393) {
                              return 'The password is invalid or the user does not have a password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            counterText: 'Forgot Password?',
                            counterStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
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
                          onPressed: () async {
                            errorCode = 0;

                            //show spinner
                            setState(() {
                              isShowModal = true;
                            });

                            //validate basic
                            if (_formKey.currentState.validate()) {
                              try {
                                String email = _emailInputController.text;
                                String password = _passwordInputController.text;

                                final user = await authProvider.signInWithEmail(
                                    email, password);
                                print('Come heareaeaeae');
                                print(user);
                                if (user != null) {
                                  Navigator.pushReplacementNamed(
                                      context, MainScreen.id);
                                }
                              } catch (e) {
                                print('HashCode:' + e.hashCode.toString());

                                errorCode = e.hashCode;
                                _formKey.currentState.validate();

                                print(e);
                                //show spinner
                              }
                            }
                            setState(() {
                              isShowModal = false;
                            });
                          },
                        ),
                        RoundButtonFullWidth(
                          color: Colors.blue,
                          fontColor: Colors.white,
                          text: 'Log In with Google',
                          onPressed: () async {
                            final user = await authProvider.signInWithGoogle();
                            String token = await user.user.getIdToken(true);
                            print('UID TOKEN:' + token);
                            if (user != null) {
                              Navigator.pushReplacementNamed(
                                  context, MainScreen.id);
                              // Navigator.of(context).popUntil((route) => false)
                              // Navigator.of(context).pop();
                              // Navigator.of(context).pop();
                              // Navigator.of(context).pushNamed(MainScreen.id);

                              // Navigator.of(context).p
                              // Navigator.of(context).removeRoute(context.)
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
