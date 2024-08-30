import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(
                s().p(context, 24),
              ),
              child: Column(
                  //main column
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      //row fiha 2 element  pic / details
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                          
                            SvgPicture.asset(
                              "assets/SocialMedia/facebook.svg",
                              width: s().p(context, 60),
                              height: s().p(context, 60),
                            ),
                            Positioned(
                                bottom: -5,
                                right: -5,
                                child: SvgPicture.asset(
                                    "assets/svg/Profile Icons/edit.svg"))
                          ],
                        ),
                        Gap(s().p(context, 8)),
                        Column(
                          // details
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User Name",
                              style: Typographie.ActionBouttom(context)
                                  .copyWith(color: primary_col),
                            ),
                            Gap(s().p(context, 2)),
                            Row(
                              children: [
                                Text(
                                  "IEEE ID : ",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: s().p(context, 10),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "232323",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: s().p(context, 10),
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(s().p(context, 8)),
                                GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(
                                        ClipboardData(text: "textToCopy"));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Copied to clipboard")),
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    "assets/svg/Profile Icons/Copy.svg",
                                    width: s().p(context, 15),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg/Profile Icons/IEEE_mail.svg"),
                        Gap(s().p(context, 16)),
                        Text("ieee mail")
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg/Profile Icons/IEEE_pswd.svg"),
                        Gap(s().p(context, 16)),
                        Text("ieee mail")
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/Profile Icons/Phone.svg"),
                        Gap(s().p(context, 16)),
                        Text("ieee mail")
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/Profile Icons/StudyF.svg"),
                        Gap(s().p(context, 16)),
                        Text("ieee mail")
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg/Profile Icons/membership.svg"),
                        Gap(s().p(context, 16)),
                        Text("ieee mail")
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg/Profile Icons/Sign_out.svg"),
                        Gap(s().p(context, 16)),
                        Text("ieee mail")
                      ],
                    )
                  ]))),
    );
  }
}
