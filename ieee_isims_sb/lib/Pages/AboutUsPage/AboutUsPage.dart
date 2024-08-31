import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsSubPage/SB.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsSubPage/Wie.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsSubPage/cs.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsSubPage/ras.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsSubPage/smc.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/Components/AboutUsItem.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(s().p(context, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Us",
                  style: Typographie.H4(context).copyWith(color: primary_col),
                ),
                Gap(s().p(context, 36)),
                AboutUsItem(
                  destination: SB(),
                  Title: "IEEE ISIMS Student Branch",
                  color: primary_col,
                  path: "assets/svg/ieee logo/sb.svg",
                ),
                Gap(s().p(context, 16)),
                AboutUsItem(
                  destination: CS(),
                  Title: "IEEE Computer Society Chapter",
                  color: cs_color,
                  path: "assets/svg/ieee logo/cs.svg",
                ),
                Gap(s().p(context, 16)),
                AboutUsItem(
                  destination: RAS(),
                  Title: "IEEE Robotics and Automation Society Chapter",
                  color: ras_color,
                  path: "assets/svg/ieee logo/ras.svg",
                ),
                Gap(s().p(context, 16)),
                AboutUsItem(
                  destination: wie(),
                  Title: "IEEE Women In Engineering Affinity Group",
                  path: "assets/svg/ieee logo/wie.png",
                  color: wie_color,
                ),
                Gap(s().p(context, 16)),
                AboutUsItem(
                  destination: SMC(),
                  Title: "IEEE Systems Man Cybernetics Society",
                  color: smc2_color,
                  path: "assets/svg/ieee logo/smc.svg",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
