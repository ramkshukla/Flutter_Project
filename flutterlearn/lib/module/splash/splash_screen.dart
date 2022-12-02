import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlearn/module/route/route.dart';

import '../../util/sharedPreference/shared_pref.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Spash Screen",
              style: TextStyle(fontSize: 50),
            ),
            Image.asset(
              "assets/images/astro_moon.png",
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      bool isTutorialViewed = PrefHelper.isTutorialViewed ?? false;
      if (isTutorialViewed) {
        Navigator.pushNamed(context, RouteClass.signupForm);
      } else {
        Navigator.pushNamed(context, RouteClass.tutorial);
      }
    });
  }
}
