import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
