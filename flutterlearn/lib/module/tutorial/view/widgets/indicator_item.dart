import 'package:flutter/material.dart';

class IndicatorItems extends StatelessWidget {
  final bool isActive;
  const IndicatorItems({super.key, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.redAccent : Colors.redAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
