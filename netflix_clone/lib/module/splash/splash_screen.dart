import 'package:flutter/material.dart';

import '../../route/route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToHomeScreen(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/netflix.png",
          width: MediaQuery.of(context).size.width - 100,
        ),
      ),
    );
  }

  _navigateToHomeScreen(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(AppRoute.homeScreen);
      },
    );
  }
}
