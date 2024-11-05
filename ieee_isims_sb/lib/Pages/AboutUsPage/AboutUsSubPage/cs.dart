import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

class CS extends StatefulWidget {
  const CS({super.key});

  @override
  State<CS> createState() => _CSState();
}

List<String> WDates = [
  "Octobre  2023",
  "November  2023",
  "February 2024",
];
List<String> EDates = [
  "November 2023",
  "February 2024",
  "March 2024",
  "Octobre  2024",
  "Octobre  2024",
];
List<String> Workshops = [
  "CP Workshop",
  "scrum and agile Session",
  "CP Workshops",
];
List<String> Events = [
  "IEEEXtreme 17.0",
  "solve it HackJam ",
  "Tech Resolve Challenge",
  "Made In CS",
  "IEEEXtreme 18.0",
];
List<String> WImagePath = [
  "assets/images/cs/cp23.jpg",
  "assets/images/cs/scrum.jpg",
  "assets/images/cs/cp24.jpg",
];
List<String> EImagePath = [
  "assets/images/cs/xtreme.jpg",
  "assets/images/cs/solveit.jpg",
  "assets/images/cs/trc.jpg",
  "assets/images/cs/mics.jpg",
  "assets/images/cs/xtreme18.jpg",
];

class _CSState extends State<CS> {
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
                              .copyWith(color: cs_color),
                        ),
                      ),
                    ],
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "The IEEE Computer Society is a professional society within the Institute of Electrical and Electronics Engineers (IEEE), focusing on computer science and technology.",
                    style: Typographie.NormalText(context),
                  ),
                  Gap(s().p(context, 24)),
                  Text(
                    "Workshops",
                    style: Typographie.miniTitle(context)
                        .copyWith(color: cs_color),
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
                        .copyWith(color: cs_color),
                  ),
                  Gap(s().p(context, 8)),
                  SizedBox(
                    height: s().p(context, 200),
                    child: ListView.builder(
                      itemCount: Events.length,
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
  final List<String> Dates;
  final List<String> Event;
  final List<String> Path;
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(
              imagePath: Path[index],
              eventTitle: Event[index],
              heroTag: 'eventImage_${Path[index]}_$index',
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Dates[index]),
          Hero(
            tag: 'eventImage_${Path[index]}_$index',
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(width: 0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Path[index]),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: const Color.fromARGB(159, 0, 0, 0),
                    ),
                    height: 33,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Center(
                          child: Text(
                            Event[index],
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetailPage extends StatelessWidget {
  final String imagePath;
  final String eventTitle;
  final String heroTag;

  const EventDetailPage({
    Key? key,
    required this.imagePath,
    required this.eventTitle,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventTitle),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Hero(
              tag: heroTag,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
