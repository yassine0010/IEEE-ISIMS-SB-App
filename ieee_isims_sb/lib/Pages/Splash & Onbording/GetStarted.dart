import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/Components/PrimaryBoutton.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/OnBording.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:page_transition/page_transition.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/BackgroundImage.png"))),
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
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Padding(
                            padding: EdgeInsets.all(s().p(context, 30)),
                            child: Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: const Onbording()));
                                    },
                                    child: const PrimaryBouttom(
                                      message: "Get Started",
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
