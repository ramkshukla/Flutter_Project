import 'package:get/get.dart';
import 'package:state_app/module/bloc_app/view/bloc_view.dart';
import 'package:state_app/module/provider_app/view/counter.dart';
import 'package:state_app/module/provider_app/view/counter_ui.dart';
import 'package:state_app/module/set_states_app/view/set_state_view.dart';

import '../../home.dart';
import '../../module/getx_app/view/main_screen.dart';

class RouteClass {
  static String home = "/";
  static String setstate = "/setstate";
  static String bloc = "/blocapp";
  static String getx = "/getxapp";
  static String providerapp = "/providerapp";

  static String getHomeRoute() => home;
  static String getSetStateRoute() => setstate;
  static String getBlocRoute() => bloc;
  static String getGetXRoute() => getx;
  static String getProviderRoute() => providerapp;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const MyHomePage(),
    ),
    GetPage(
      name: setstate,
      page: () => const SetStateApp(),
    ),
    GetPage(
      name: bloc,
      page: () => const BlocApp(),
    ),
    GetPage(
      name: getx,
      page: () => const GetXPage(),
    ),
    GetPage(
      name: providerapp,
      page: () => MyProviderPage(),
    ),
  ];
}
