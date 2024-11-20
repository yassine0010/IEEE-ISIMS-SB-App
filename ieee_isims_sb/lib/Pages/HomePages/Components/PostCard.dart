import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/HomePages/AddPostPage.dart';
import 'package:ieee_isims_sb/Pages/HomePages/Components/Dialog.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/models/PostModel.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:url_launcher/url_launcher.dart';

class PostCard extends StatelessWidget {
  final String role;
  final Post post;
  const PostCard({
    super.key,
    required this.role,
    required this.post,
  });
  void _launchURL() async {
    String url = post.formLink!;
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
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
                        LineIcon.userCircle(
                          color: primary_col,
                          size: s().p(context, 46),
                        ),
                        Gap(s().p(context, 8)),
                        Column(
                          // details
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.postOwner!,
                              style: Typographie.H5(context)
                                  .copyWith(color: primary_col),
                            ),
                            if (post.postDate != null) ...[
                              Text(
                                post.postDate!.format('D, M j, H:i'),
                                style: TextStyle(
                                    color: black,
                                    fontSize: s().p(context, 8),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                            Gap(s().p(context, 2)),
                            if (post.postDeadline != null) ...[
                              Text(
                                post.postDeadline,
                                style: TextStyle(
                                    color: smc_color,
                                    fontSize: s().p(context, 8),
                                    fontWeight: FontWeight.w600),
                              ),
                            ]
                          ],
                        ),
                        if (role == "Admin") ...[
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Addpostpage(
                                        id: post.id,
                                        post: post,
                                        PopUpText:
                                            "Sure You Want To Update This Post?",
                                      ),
                                    ));
                              },
                              child: const LineIcon.pen()),
                          Gap(s().p(context, 8)),
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return popup(
                                      id: post.id,
                                      PopUpText:
                                          "Sure You Want To Delete This Post?",
                                    );
                                  },
                                );
                              },
                              child: const LineIcon.minus())
                        ]
                      ],
                    ),
                    Gap(s().p(context, 9)),
                    Text(
                      post.title,
                      style: Typographie.H5(context)
                          .copyWith(color: const Color(0xff3184D9)),
                    ),
                    Gap(s().p(context, 9)),
                    //body
                    Text(
                      post.postContent,
                      style: Typographie.Body(context).copyWith(color: black),
                    ),
                    if (post.formLink != null) ...[
                      Row(
                        //link
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Link: ",
                            style: Typographie.Placeholder(context)
                                .copyWith(color: const Color(0xff3184D9)),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _launchURL();
                              },
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                post.formLink!,
                                style: TextStyle(
                                    color: smc2_color,
                                    fontSize: s().p(context, 10),
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    Gap(s().p(context, 9)),

                    if (post.image!.isNotEmpty) ...[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: MemoryImage(post.image!))),
                      )
                    ]
                  ],
                )),
          ),
        )
      ],
    );
  }
}
