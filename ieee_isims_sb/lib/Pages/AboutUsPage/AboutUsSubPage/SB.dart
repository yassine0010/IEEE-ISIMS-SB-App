import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

class SB extends StatefulWidget {
  const SB({super.key});

  @override
  State<SB> createState() => _SBState();
}

List<String> WDates = [
  "December  2023",
  "December  2023",
  "February 2024",
  "Juillet 2024",
  "September 2024",
  "Octobre 2024",
];
List<String> EDates = [
  "Octobre 2023",
  "February 2024",
  "Octobre 2024",
];
List<String> Workshops = [
  "Pitch Perfect Online Session",
  "Leadrship session",
  "Media Bootcamp",
  "EIPP virtual talk",
  "TSYP Challenges Session",
  "IEEEXTREME 18.0 Training Session"
];
List<String> Events = [
  "IEEEDAY 2023",
  "SB 4-th anniversary",
  "IEEEDAY 2024",
];
List<String> WImagePath = [
  "assets/images/SB/pitch_perfect.jpg",
  "assets/images/SB/leadership.jpg",
  "assets/images/SB/bootcamp.jpg",
  "assets/images/SB/EIPP.jpg",
  "assets/images/SB/tsyp2024.jpg",
  "assets/images/SB/xtreme18.jpg",
];
List<String> EImagePath = [
  "assets/images/SB/ieeeday.jpg",
  "assets/images/SB/anniv.jpg",
  "assets/images/SB/ieeeday2024.jpg",
];

class _SBState extends State<SB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(s().p(context, 16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const LineIcon.arrowLeft()),
                      Gap(s().p(context, 16)),
                      Expanded(
                        child: Text(
                          "IEEE ISIMS Student Branch",
                          style: Typographie.miniTitle(context)
                              .copyWith(color: primary_col),
                        ),
                      ),
                    ],
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "IEEE ISIMS Student Branch was established on November 2019 and has more than 90 members. Our Student Branch offers its members numerous educational, technical and professional advantages through different projects, workshops and events.",
                    style: Typographie.NormalText(context),
                  ),
                  Gap(s().p(context, 24)),
                  Text(
                    "Workshops",
                    style: Typographie.miniTitle(context)
                        .copyWith(color: primary_col),
                  ),
                  Gap(s().p(context, 8)),
                  SizedBox(
                    height: s().p(context, 200),
                    child: ListView.builder(
                      itemCount: WDates.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            EventElement(
                              Dates: WDates,
                              Event: Workshops,
                              Path: WImagePath,
                              index: index,
                            ),
                            Gap(s().p(context, 16))
                          ],
                        );
                      },
                    ),
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "Events",
                    style: Typographie.miniTitle(context)
                        .copyWith(color: primary_col),
                  ),
                  Gap(s().p(context, 8)),
                  SizedBox(
                    height: s().p(context, 210),
                    child: ListView.builder(
                      itemCount: EDates.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            EventElement(
                              Dates: EDates,
                              Event: Events,
                              Path: EImagePath,
                              index: index,
                            ),
                            Gap(s().p(context, 16))
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventElement extends StatelessWidget {
  final List Dates;
  final List Event;
  final List Path;
  final int index;
  const EventElement({
    super.key,
    required this.index,
    required this.Dates,
    required this.Event,
    required this.Path,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Dates[index]),
        Container(
          width: s().p(context, 180),
          height: s().p(context, 180),
          decoration: BoxDecoration(
              border: Border.all(width: 0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(Path[index])),
              borderRadius: BorderRadius.circular(s().p(context, 10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(s().p(context, 10)),
                        bottomLeft: Radius.circular(s().p(context, 10))),
                    color: const Color.fromARGB(159, 0, 0, 0),
                  ),
                  height: s().p(context, 33),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Center(
                          child: Text(
                        Event[index],
                        style: TextStyle(
                            fontSize: s().p(context, 11),
                            color: white,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
