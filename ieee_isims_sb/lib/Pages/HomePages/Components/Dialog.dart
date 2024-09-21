import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/HomePages/HomePage.dart';
import 'package:ieee_isims_sb/Pages/Layout/Layout.dart';
import 'package:ieee_isims_sb/Services/PostService.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/models/PostModel.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class popup extends StatelessWidget {
  final Post? post;
  final int? id;
  final String PopUpText;
  popup({
    super.key,
    this.post,
    required this.PopUpText,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(s().p(context, 8))),
      children: [
        Padding(
          padding: EdgeInsets.all(s().p(context, 8)),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.85,
            height: s().p(context, 90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(PopUpText,
                        style: Typographie.H5(context)
                            .copyWith(color: const Color(0xff54595E))),
                  ],
                ),
                Gap(s().p(context, 16)),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: s().p(context, 30),
                                vertical: s().p(context, 8)),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: primary_col),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(50)),
                            child: Center(
                                child: Text(
                              "No , Cancel",
                              style: Typographie.Placeholder(context)
                                  .copyWith(color: primary_col),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Gap(s().p(context, 16)),
                    GestureDetector(
                      onTap: () async {
                        if (PopUpText == "Sure You Want To Update This Post?") {
                          await UpdatePost(id!, post!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Post Succsesfully Updated')),
                          );
                        } else if (PopUpText ==
                            "Sure You Want To Delete This Post?") {
                          await DeletePost(id!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Post Succsesfully Deleted')),
                          );
                          Navigator.pop(context);
                        } else {
                          await UploadPost(post!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                    'Post Succsesfully Uploaded, please reopen the app (bug)')),
                          );
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LayoutPage(
                                      isvisitor: false,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: s().p(context, 30),
                            vertical: s().p(context, 8)),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: primary_col,
                            borderRadius: BorderRadiusDirectional.circular(50)),
                        child: Center(
                            child: Text("Yes I'm Sure",
                                style: Typographie.Placeholder(context)
                                    .copyWith(color: white))),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
