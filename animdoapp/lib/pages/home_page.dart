import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRadius = 100;
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  AnimationController? _starAnimationController;
  @override
  void initState() {
    super.initState();
    _starAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _starAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          _pageBackGround(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _circularAnimationButton(),
              _starIcon(),
            ],
          )
        ],
      ),
    );
  }

  Widget _pageBackGround() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCubicEmphasized,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _circularAnimationButton() {
    return Center(
        child: GestureDetector(
      onTap: () {
        setState(() {
          _buttonRadius += _buttonRadius == 200 ? -100 : 100;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.bounceInOut,
        height: _buttonRadius,
        width: _buttonRadius,
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_buttonRadius)),
        child: const Center(
          child: Text(
            "Basic!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ));
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _starAnimationController!.view,
      builder: (buildContext, child) {
        return Transform.rotate(
          angle: _starAnimationController!.value * 2 * pi,
          child: child,
        );
      },
      child: const Icon(Icons.star, size: 100, color: Colors.white),
    );
  }
}
