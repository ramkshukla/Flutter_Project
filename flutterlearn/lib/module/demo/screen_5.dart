import 'package:flutter/material.dart';
import 'package:flutterlearn/module/route/route.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.cyanAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Screen 5",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.popUntil(context, ModalRoute.withName('/screen2'));
              Navigator.of(context).push(
                RouteClass().getScreen1(),
                // (route) {return (route.settings.name != RouteClass.screen3)},
              );
            },
            child: const Text("Next Page"),
          )
        ],
      ),
    );
  }
}
