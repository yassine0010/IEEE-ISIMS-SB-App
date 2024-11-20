import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Providers/ProfileProvider.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/models/ProfileModel.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

bool isload = true;

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState() {
    Provider.of<ProfileProvider>(context, listen: false).getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Profile? UserProfile = Provider.of<ProfileProvider>(
      context,
    ).UserProfile;
    isload = Provider.of<ProfileProvider>(context, listen: false).isload;
    return Scaffold(
      backgroundColor: bg_col,
      body: isload
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
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
                                LineIcon.userCircle(
                                  color: primary_col,
                                  size: s().p(context, 60),
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
                                  UserProfile?.name ?? "none",
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
                                      UserProfile?.ieeeId ?? "none",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: s().p(context, 10),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Gap(s().p(context, 8)),
                                    GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                UserProfile?.ieeeId ?? "none"));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text("Copied to clipboard")),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        "assets/svg/Profile Icons/Copy.svg",
                                        width: s().p(context, 20),
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
                            Text(UserProfile?.email ?? "none")
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/svg/Profile Icons/IEEE_mail.svg"),
                            Gap(s().p(context, 16)),
                            Text(UserProfile?.ieeeEmail ?? "none")
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/svg/Profile Icons/Phone.svg"),
                            Gap(s().p(context, 16)),
                            Text(UserProfile?.phoneNumber ?? "none")
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/svg/Profile Icons/membership.svg"),
                            Gap(s().p(context, 16)),
                            Text(UserProfile?.membership ?? "none")
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove("loginValues");
                            prefs.setBool("is_SignIn", false);
                            prefs.setBool("isvisitor", false);
                            SystemNavigator.pop();
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/svg/Profile Icons/Sign_out.svg"),
                              Gap(s().p(context, 16)),
                              const Text("Sign Out")
                            ],
                          ),
                        )
                      ]))),
    );
  }
}
