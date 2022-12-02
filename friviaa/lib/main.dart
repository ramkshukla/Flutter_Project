import 'package:flutter/material.dart';
import 'package:friviaa/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: "ArchitectsDaughter",
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1.9),
      ),
      home: HomePage(),
    );
  }
}
