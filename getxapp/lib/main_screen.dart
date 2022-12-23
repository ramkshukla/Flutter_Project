import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/main_screen_controller.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    return Scaffold(
      backgroundColor: Colors.white,

      /// app bar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Counter App with GetX',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),

      /// body
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// value increase or decrease
            Obx(
              () => Text(
                'Value ${controller.value}',
                style: const TextStyle(
                  fontSize: 60.0,
                  color: Colors.black,
                ),
              ),
            ),

            /// buttons to increase or decrease value
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    controller.add();
                  },
                  backgroundColor: Colors.blueAccent,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 40.0),
                FloatingActionButton(
                  onPressed: () {
                    controller.subtract();
                  },
                  backgroundColor: Colors.blueAccent,
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
