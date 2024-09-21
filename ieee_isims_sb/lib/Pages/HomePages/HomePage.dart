import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/HomePages/Components/PostCard.dart';
import 'package:ieee_isims_sb/Providers/ProfileProvider.dart';
import 'package:ieee_isims_sb/Services/PostService.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/models/PostModel.dart';
import 'package:ieee_isims_sb/models/ProfileModel.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  bool? isvisitor;
  Homepage({super.key, this.isvisitor});

  @override
  State<Homepage> createState() => _HomepageState();
}

bool isload = true;

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    Provider.of<ProfileProvider>(context, listen: false).getDetails();
    super.initState();
  }

  // Future<bool> userTest() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   bool isvisitor = prefs.getBool("isvisitor") ?? false;
  //   print(isvisitor);
  //   return isvisitor;
  // }

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

  Future<List<Post>?> fetchPosts() async {
    final List<Post>? posts = await ReadAllPosts();
    return posts;
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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              color: primary_col,
              onRefresh: () async {
                await fetchPosts();
                setState(() {});
                // Trigger a rebuild after refreshing
              },
              child: SafeArea(
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
                                  const Spacer(),
                                  if (UserProfile?.role == "Admin") ...[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/AddPage');
                                      },
                                      child: LineIcon.plusCircle(
                                        color: primary_col,
                                        size: s().p(context, 36),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                              Gap(s().p(context, 16)),
                            ],
                          )),
                    ),
                    if (widget.isvisitor == false) ...[
                      FutureBuilder<List<Post>?>(
                        future: fetchPosts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return SliverToBoxAdapter(
                              child: Center(
                                child: Text("An error occurred"),
                              ),
                            );
                          }
                          if (ConnectionState.none ==
                              snapshot.connectionState) {
                            print("object");
                            return SliverToBoxAdapter(
                              child: Center(
                                child: Text("Internet Connexion Problem"),
                              ),
                            );
                          }

                          if (snapshot.hasData && snapshot.data!.isEmpty) {
                            return SliverToBoxAdapter(
                              child: Center(
                                child: Text("No posts available"),
                              ),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          if (snapshot.hasData) {
                            final postList = snapshot.data!.reversed.toList();

                            return SliverList.builder(
                              itemCount: postList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    PostCard(
                                      post: postList[index],
                                      role: UserProfile!.role,
                                    ),
                                    Gap(s().p(context, 10))
                                  ],
                                );
                              },
                            );
                          } else {
                            print("test");
                            return SliverToBoxAdapter(
                                child: Center(
                                    child: CircularProgressIndicator(
                              color: primary_col,
                            )));
                          }
                        },
                      ),
                    ],
                    if (widget.isvisitor == true) ...[
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/svg/unauthorized.svg"),
                            Gap(s().p(context, 16)),
                            Text(
                              "IEEE Membership is required",
                              style: Typographie.H5(context)
                                  .copyWith(color: primary_col),
                            )
                          ],
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
    );
  }
}
