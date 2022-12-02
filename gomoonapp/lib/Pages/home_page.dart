import 'package:flutter/material.dart';
import 'package:gomoonapp/widgets/custom_dropdown_button.dart';

class MyHomePage extends StatelessWidget {
  double? _deviceHeight, _devideWidth;

  MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _devideWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: _deviceHeight,
            width: _devideWidth,
            padding: EdgeInsets.symmetric(horizontal: _devideWidth! * 0.05),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _pageTitle(),
                    _bookRideWidget(),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: _astroImageWidget(),
                )
              ],
            )),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
          color: Colors.white, fontSize: 70, fontWeight: FontWeight.w800),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      height: _deviceHeight! * 0.50,
      width: _devideWidth! * 0.65,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/astro_moon.png"))),
    );
  }

  Widget _bookRideWidget() {
    return Container(
      height: _deviceHeight! * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travellerInformationWidget(),
          _rideButton()
        ],
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropDownButton(
      values: const [
        "James Webb Station",
        "Preneure Station",
      ],
      width: _devideWidth,
    );
  }

  Widget _travellerInformationWidget() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomDropDownButton(
              values: const ["1", "2", "3", "4"], width: _devideWidth! * 0.40),
          CustomDropDownButton(
              values: const ["Economy", "Business", "First", "Private"],
              width: _devideWidth! * 0.40),
        ]);
  }

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight! * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: _devideWidth,
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book Ride!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
