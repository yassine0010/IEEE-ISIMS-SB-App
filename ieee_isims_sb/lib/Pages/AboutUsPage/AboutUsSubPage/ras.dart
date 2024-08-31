import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

class RAS extends StatefulWidget {
  const RAS({super.key});

  @override
  State<RAS> createState() => _RASState();
}

List<String> WDates = [
  "November 2023",
  "January  2024",
  "February 2024",
];

List<String> Workshops = [
  "Robotic  initiation",
  "All-Terrain Robots Workshop",
  "Line Follower Robots workshop",
];

List<String> WImagePath = [
  "assets/images/ras/robotic.jpg",
  "assets/images/ras/terrain.jpg",
  "assets/images/ras/line.jpg",
];

class _RASState extends State<RAS> {
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
                          child: LineIcon.arrowLeft()),
                      Gap(s().p(context, 16)),
                      Expanded(
                        child: Text(
                          "IEEE Robotics and Automation Society Chapter",
                          style: Typographie.miniTitle(context)
                              .copyWith(color: ras_color),
                        ),
                      ),
                    ],
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "IEEE Robotics and Automation Society (RAS) aims to advance the development and application of robotics and automation through research, publications, and conferences.",
                    style: Typographie.NormalText(context),
                  ),
                  Gap(s().p(context, 24)),
                  Text(
                    "Workshops",
                    style: Typographie.miniTitle(context)
                        .copyWith(color: ras_color),
                  ),
                  Gap(s().p(context, 8)),
                  SizedBox(
                    height: s().p(context, 210),
                    child: ListView.builder(
                      itemCount: 3,
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
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(s().p(context, 10)),
                        bottomLeft: Radius.circular(s().p(context, 10))),
                    color: Color.fromARGB(159, 0, 0, 0),
                  ),
                  height: s().p(context, 33))
            ],
          ),
        ),
      ],
    );
  }
}
