import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_app/_util/routes/routes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("State Mangement Tool"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteClass.setstate);
              },
              child: const Text("SetStates App"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteClass.bloc);
              },
              child: const Text("Bloc App"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteClass.getx);
              },
              child: const Text("GetX App"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteClass.providerapp);
              },
              child: const Text("Provider App"),
            ),
          ],
        ),
      ),
    );
  }
}
