import 'package:flutter/material.dart';
import 'package:frontend/data/user_data.dart';
import 'package:frontend/screens/login_page.dart';
import 'package:frontend/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // UserData user = UserData();
    // user.login();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      home: LoginPage(),
    );
  }
}
