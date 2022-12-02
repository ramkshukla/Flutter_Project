import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '_utils/configs/app_state.dart';
import '_utils/configs/theme_config.dart';
import '_utils/constants/app_constants.dart';
import '_utils/constants/routes.dart';
import 'home/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          appState = Provider.of<AppState>(context, listen: false);
          return GetMaterialApp(
            title: 'Moveo',
            theme: appThemeData['light'],
            home: const HomePage(),
            initialRoute: "/",
            getPages: pages,
          );
        },
      ),
    );
  }
}
