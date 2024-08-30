import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/HomePages/HomePage.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class popup extends StatelessWidget {
  const popup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: EdgeInsets.all(0),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(s().p(context, 8))),
      children: [
        Padding(
          padding: EdgeInsets.all(s().p(context, 8)),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: s().p(context, 90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sure You Want To Uplod This Post?",
                        style: Typographie.H5(context)
                            .copyWith(color: Color(0xff54595E))),
                  ],
                ),
                Gap(s().p(context, 16)),
                Row(
                  children: [
                    Spacer(),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
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
                    Spacer()
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
