import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _launchFacebookURL() async {
    const url = 'https://www.facebook.com/IEEEStudentBranchISIMSf';
    await launch(url);
  }

  void _launchInstagramURL() async {
    const url = 'https://www.instagram.com/ieee.isims.sb/';
    await launch(url);
  }

  void _launchLinkedinURL() async {
    const url =
        'https://www.linkedin.com/company/ieee-student-branch-isim-sfax/';
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.all(
                    s().p(context, 16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To IEEE ISIMS SB App ! ",
                        style: Typographie.H3(context)
                            .copyWith(color: primary_col),
                      ),
                      Gap(s().p(context, 16)),
                      Text(
                        "Great Stories Begin Here !",
                        style: Typographie.Placeholder(context),
                      ),
                      Gap(s().p(context, 16)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchFacebookURL();
                            },
                            child: SvgPicture.asset(
                              "assets/SocialMedia/facebook.svg",
                              width: s().p(context, 36),
                              height: s().p(context, 36),
                            ),
                          ),
                          Gap(s().p(context, 27)),
                          GestureDetector(
                            onTap: () {
                              _launchInstagramURL();
                            },
                            child: SvgPicture.asset(
                              "assets/SocialMedia/Instagram.svg",
                              width: s().p(context, 36),
                              height: s().p(context, 36),
                            ),
                          ),
                          Gap(s().p(context, 27)),
                          GestureDetector(
                            onTap: () {
                              _launchLinkedinURL();
                            },
                            child: SvgPicture.asset(
                              "assets/SocialMedia/Linkedin.svg",
                              width: s().p(context, 36),
                              height: s().p(context, 36),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/AddPage');
                            },
                            child: LineIcon.plusCircle(
                              color: primary_col,
                              size: s().p(context, 36),
                            ),
                          )
                        ],
                      ),
                      Gap(s().p(context, 16)),
                    ],
                  )),
            ),
            SliverList.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return PostCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius:
                    BorderRadius.all(Radius.circular(s().p(context, 12)))),
            child: Padding(
                padding: EdgeInsets.all(s().p(context, 16)),
                child: Column(
                  //main column
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //row fiha 3 element profile pic / details / admin optins
                      children: [
                        SvgPicture.asset(
                          "assets/SocialMedia/facebook.svg",
                          width: s().p(context, 46),
                          height: s().p(context, 46),
                        ),
                        Gap(s().p(context, 8)),
                        Column(
                          // details
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User Name",
                              style: Typographie.H5(context)
                                  .copyWith(color: primary_col),
                            ),
                            Text(
                              "Posting Date",
                              style: TextStyle(
                                  color: black,
                                  fontSize: s().p(context, 8),
                                  fontWeight: FontWeight.w400),
                            ),
                            Gap(s().p(context, 2)),
                            Text(
                              "Optional Dedaline",
                              style: TextStyle(
                                  color: smc_color,
                                  fontSize: s().p(context, 8),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Spacer(),
                        LineIcon.pen(),
                        Gap(s().p(context, 8)),
                        LineIcon.minus()
                      ],
                    ),
                    Gap(s().p(context, 9)),
                    Text(
                      "IEEE DAY CALL FOR OC ",
                      style: Typographie.H5(context)
                          .copyWith(color: Color(0xff3184D9)),
                    ),
                    Gap(s().p(context, 9)),
                    //body
                    Text(
                      "Body",
                      style: Typographie.Body(context).copyWith(color: black),
                    ),
                    Row(
                      //link
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Form Link : ",
                          style: Typographie.Placeholder(context)
                              .copyWith(color: Color(0xff3184D9)),
                        ),
                        Expanded(
                          child: Text(
                            "https://docs.google.com/forms/d/e/1FAIpQLScOVqE2BzFjsTb4lZsMVOr--dCL1Frz98T6d3LS30hfMFXAKQ/closedform",
                            style: TextStyle(
                                color: smc2_color,
                                fontSize: s().p(context, 10),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    Gap(s().p(context, 9)),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/BackgroundImage.png"))),
                    )
                  ],
                )),
          ),
        )
      ],
    );
  }
}
