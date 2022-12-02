import 'package:get/get_navigation/get_navigation.dart';
import 'package:moveoapp/welcome.dart';

import '../../home/view/home.dart';
import '../../home/view/movie_info.dart';

class RouteNames {
  // static const String loginPage = "/login";
  // static const String signupPage = "/signup";
  // static const String onboarding = "/onboarding";
  // static const String mainHome = "/main_home";
  static const String homePage = "/home_page";
  static const String movieInfo = "/movie_info";
}

final pages = [
  GetPage(name: '/', page: () => const Welcome()),
  GetPage(name: RouteNames.homePage, page: () => const HomePage()),
  GetPage(name: RouteNames.movieInfo, page: () => const MovieInfoPage()),
];
