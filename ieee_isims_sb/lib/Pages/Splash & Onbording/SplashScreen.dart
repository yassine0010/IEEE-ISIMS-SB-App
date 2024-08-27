import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/GetStarted.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GetStarted(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      body: Center(
          child: Animate(
        effects: [
          FadeEffect(duration: 2.seconds),
        ],
        child: SvgPicture.asset(
          "assets/svg/SB_logo.svg",
          width: s().p(context, 124),
          height: s().p(context, 113),
        ),
      )),
    );
  }
}
