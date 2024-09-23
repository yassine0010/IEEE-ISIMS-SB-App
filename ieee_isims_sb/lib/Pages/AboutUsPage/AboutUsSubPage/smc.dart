import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

class SMC extends StatefulWidget {
  const SMC({super.key});

  @override
  State<SMC> createState() => _SMCState();
}

List<String> PDates = [
  "September 2203",
];
List<String> projects = [
  "IEEE ISIMS SB APP",
];

List<String> PImagePath = [
  "assets/images/smc/app.png",
];

class _SMCState extends State<SMC> {
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
                          "IEEE Systems Man Cybernetics Society",
                          style: Typographie.miniTitle(context)
                              .copyWith(color: smc2_color),
                        ),
                      ),
                    ],
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "The IEEE SMC Society focuses on advancing knowledge in Systems, Man, and Cybernetics through a variety of technical activities. It supports research and development in areas like artificial intelligence, robotics, and human-machine interaction.",
                    style: Typographie.NormalText(context),
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "Projects",
                    style: Typographie.miniTitle(context)
                        .copyWith(color: smc2_color),
                  ),
                  Gap(s().p(context, 8)),
                  SizedBox(
                    height: s().p(context, 210),
                    child: ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            EventElement(
                              Dates: PDates,
                              Event: projects,
                              Path: PImagePath,
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
