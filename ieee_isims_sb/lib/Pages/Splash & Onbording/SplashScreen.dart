import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Sign%20In/Sign%20In.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/GetStarted.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('FirstTime') ?? true;

    Timer(
      const Duration(seconds: 4),
      () {
        if (isFirstTime) {
          prefs.setBool('FirstTime', false);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GetStarted()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        }
      },
    );
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
        ),
      ),
    );
  }
}
