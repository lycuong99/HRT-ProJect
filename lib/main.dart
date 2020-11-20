import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hire_remote_team/providers/firebase_auth.dart';
import 'package:hire_remote_team/providers/push_notification.dart';
import 'package:hire_remote_team/screens/create_contract_screen_body.dart';
import 'package:hire_remote_team/screens/home_screen.dart';
import 'package:hire_remote_team/screens/login_screen.dart';
import 'package:hire_remote_team/screens/main_screen.dart';
import 'package:hire_remote_team/screens/signin_screen.dart';
import 'package:hire_remote_team/screens/welcome_screen.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await FlutterConfig.loadEnvVariables();
//   runApp(MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // PushNotificationService pushNotificationService = PushNotificationService();
  // await pushNotificationService.initialise();
  PushNotificationsManager pushNotificationsManager =
      PushNotificationsManager();
  pushNotificationsManager.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: _getLandingPage(),
      initialRoute: WelcomeScreen.id,
      routes: <String, WidgetBuilder>{
        LoginScreen.id: (context) => LoginScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MainScreen.id: (context) => MainScreen(),
        CreateContractScreen.id: (context) => CreateContractScreen(),
      },
    );
  }

  Widget _getLandingPage() {
    return StreamBuilder<User>(
      stream: AuthProvider().authStateChange,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.providerData.length == 1) {
            // logged in using email and password
            return MainScreen();
          } else {
            // logged in using other providers
            return MainScreen();
          }
        } else {
          return WelcomeScreen();
        }
      },
    );
  }
}
