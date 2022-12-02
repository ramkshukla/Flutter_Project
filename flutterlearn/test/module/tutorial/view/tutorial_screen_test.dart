import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlearn/module/http/view/http_screen.dart';
import 'package:flutterlearn/module/makemytrip/buzz_screen.dart';
import 'package:flutterlearn/module/route/route.dart';
import 'package:flutterlearn/module/signup/view/signup_view.dart';
import 'package:flutterlearn/module/tutorial/view/tutorial_screen.dart';
import 'package:flutterlearn/util/helper/app_string.dart';

void main() {
  testWidgets("testing tutorial", (widgetTester) async {
    Widget widget = MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        home: const PageViewApp(),
        routes: {
          RouteClass.splashScreen: (context) => const PageViewApp(),
          RouteClass.signupForm: (context) => const SignupForm(),
          RouteClass.tutorial: (context) => const HttpScreen(),
          RouteClass.makemytrip: (context) => const BuzzScreen()
        });
    await widgetTester.pumpWidget(widget);
    await widgetTester.pumpAndSettle();
    await widgetTester.pump(const Duration(seconds: 2));
    await widgetTester.pumpAndSettle();
    await widgetTester.longPress(find.byType(GestureDetector).first);
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byType(ElevatedButton));
    await widgetTester.pumpAndSettle();
  });
}
