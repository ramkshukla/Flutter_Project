import 'package:flutter/material.dart';
import 'package:flutterlearn/module/route/route.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Screen 4",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  RouteClass().getScreen5(),
                  //(route) {return (route.settings.name == RouteClass.screen2)
                  ModalRoute.withName(RouteClass.screen2));
            },
            child: const Text("Next Page"),
          )
        ],
      ),
    );
  }
}
