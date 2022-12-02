import 'package:flutter/material.dart';
import 'package:flutterlearn/module/http/view/http_screen.dart';
import 'package:flutterlearn/module/makemytrip/buzz_screen.dart';
import 'package:flutterlearn/module/tutorial/view/tutorial_screen.dart';
import 'package:flutterlearn/util/helper/app_string.dart';

import 'module/route/route.dart';
import 'module/signup/view/signup_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        initialRoute: RouteClass.tutorial,
        routes: {
          // RouteClass.splashScreen: (context) => const HttpScreen(),
          // RouteClass.signupForm: (context) => const SignupForm(),
          RouteClass.tutorial: (context) => const PageViewApp(),
          // RouteClass.makemytrip: (context) => const BuzzScreen()
        });
  }
}
