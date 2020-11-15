import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hire_remote_team/screens/home_screen.dart';
import 'package:hire_remote_team/screens/login_screen.dart';
import 'package:hire_remote_team/screens/signin_screen.dart';
import 'package:hire_remote_team/screens/welcome_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',https://gist.github.com/9134ae1fb22db998bfb16347e5d2fd3b
      theme: ThemeData(fontFamily: 'OpenSans'),
      initialRoute: WelcomeScreen.id,
      routes: <String, WidgetBuilder>{
        LoginScreen.id: (context) => LoginScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
