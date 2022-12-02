import 'package:flutter/material.dart';
import 'package:flutterlearn/module/signup/view/signup_view.dart';
import 'package:flutterlearn/module/tutorial/view/tutorial_screen.dart';

import '../demo/screen_1.dart';
import '../demo/screen_2.dart';
import '../demo/screen_3.dart';
import '../demo/screen_4.dart';
import '../demo/screen_5.dart';

class RouteClass {
  static const String screen1 = "/screen1";
  static const String screen2 = "/screen2";
  static const String screen3 = "/screen3";
  static const String screen4 = "/screen4";
  static const String screen5 = "/screen5";
  static const String tutorial = "/tutorial";
  static const String signupForm = "/signform";
  static const String splashScreen = "/splashscreen";
  static const String makemytrip = "/makemytrip";

  static const String screen1Argument = "screen 1";
  static const String screen2Argument = "screen 2";
  static const String screen3Argument = "screen 3";
  static const String screen4Argument = "screen 4";
  static const String screen5Argument = "screen 5";
  static const String tutorialArgument = "tutorial";
  static const String signupArgument = "SignupForm";

  MaterialPageRoute getSignupForm() {
    return MaterialPageRoute(
      builder: (context) => const SignupForm(),
      settings: const RouteSettings(
          name: RouteClass.signupForm, arguments: RouteClass.signupForm),
    );
  }

  MaterialPageRoute getTutorial() {
    return MaterialPageRoute(
      builder: (context) => const PageViewApp(),
      settings: const RouteSettings(
          name: RouteClass.tutorial, arguments: RouteClass.tutorialArgument),
    );
  }

  MaterialPageRoute getScreen1() {
    return MaterialPageRoute(
      builder: (context) => const Screen1(),
      settings: const RouteSettings(
          name: RouteClass.screen1, arguments: RouteClass.screen1Argument),
    );
  }

  MaterialPageRoute getScreen2() {
    return MaterialPageRoute(
      builder: (context) => const Screen2(),
      settings: const RouteSettings(
          name: RouteClass.screen2, arguments: RouteClass.screen2Argument),
    );
  }

  MaterialPageRoute getScreen3() {
    return MaterialPageRoute(
      builder: (context) => const Screen3(),
      settings: const RouteSettings(
          name: RouteClass.screen3, arguments: RouteClass.screen3Argument),
    );
  }

  MaterialPageRoute getScreen4() {
    return MaterialPageRoute(
      builder: (context) => const Screen4(),
      settings: const RouteSettings(
          name: RouteClass.screen4, arguments: RouteClass.screen4Argument),
    );
  }

  MaterialPageRoute getScreen5() {
    return MaterialPageRoute(
      builder: (context) => const Screen5(),
      settings: const RouteSettings(
          name: RouteClass.screen5, arguments: RouteClass.screen5Argument),
    );
  }
}
