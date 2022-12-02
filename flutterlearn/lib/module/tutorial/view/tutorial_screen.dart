import 'package:flutter/material.dart';
import 'package:flutterlearn/module/route/route.dart';
import 'package:flutterlearn/module/tutorial/view/widgets/indicator_item.dart';
import 'package:flutterlearn/util/helper/app_color.dart';
import '../../../util/sharedPreference/shared_pref.dart';
import '../model/tutorial_model.dart';
import 'dart:async';

class PageViewApp extends StatefulWidget {
  const PageViewApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PageViewApp();
  }
}

class _PageViewApp extends State<StatefulWidget> {
  static const int _tutorialBaseItem = 1000;
  int _currentPage = 0;
  final PageController _pageController =
      PageController(initialPage: _tutorialBaseItem, viewportFraction: 1.0);

  int longPressIncrementDuration = 400;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _stopTimer();
  }

  _startTimer() {
    _timer = _getTimer();
  }

  _stopTimer() {
    _timer?.cancel();
  }

  Timer _getTimer() {
    return Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        _nextPage();
      },
    );
  }

  _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  _onPageChanged(int index) {
    setState(
      () {
        _currentPage = _getRealIndex(index);
      },
    );
  }

  int _getRealIndex(int index) {
    int length = tutorialData.length;
    int offset = index - _tutorialBaseItem;
    int result = offset % length;
    return result < 0 ? length + result : result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _buildPageView(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                for (int i = 0; i < tutorialData.length; i++)
                  IndicatorItems(isActive: i == _currentPage),
                const Spacer(),
                SizedBox(
                  height: 15,
                  width: 60,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                    ),
                    onPressed: () {
                      PrefHelper.setIsTutorialViewed(true);
                      Navigator.push(context, RouteClass().getSignupForm());
                    },
                    child: const Text("Skip"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageViewData(int index) {
    return Container(
      color: AppColor.containerColor,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tutorialData[index].appName,
          ),
          Text(
            tutorialData[index].title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            tutorialData[index].description,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Image(image: AssetImage(tutorialData[index].image)),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      onPageChanged: _onPageChanged,
      controller: _pageController,
      itemBuilder: (context, index) => GestureDetector(
        onLongPressStart: (_) => _stopTimer(),
        onLongPressEnd: (_) => _startTimer(),
        child: _buildPageViewData(
          _getRealIndex(index),
        ),
      ),
    );
  }
}
