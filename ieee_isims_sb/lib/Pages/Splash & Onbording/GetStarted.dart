import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/Components/BottomContainer.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/OnBording.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';

class GetStarted extends StatefulWidget {
  GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            child: SafeArea(
              child: Column(
                children: [
                  Gap(MediaQuery.of(context).size.width / 3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore,",
                        style: Typographie.H1(context).copyWith(color: white),
                      ),
                      Text(
                        "Innovate,",
                        style: Typographie.H1(context).copyWith(color: white),
                      ),
                      Text(
                        "Connect.",
                        style: Typographie.H1(context).copyWith(color: white),
                      ),
                    ],
                  ),
                  Spacer(),
                  bottomContainer(
                    mess: "Get Started",
                    NextWidgetPB: Onbording(),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/BackgroundImage.png"))),
          ),
        ));
  }
}
