import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/screens/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });

    return Scaffold(
      body: Center(child: Text('splash page')),
    );
  }
}
