import 'package:flutter/material.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/Components/PrimaryBoutton.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/GetStarted.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class bottomContainer extends StatelessWidget {
  final String mess;
  final Widget NextWidgetPB;

  const bottomContainer({
    super.key,
    required this.mess,
    required this.NextWidgetPB,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Padding(
              padding: EdgeInsets.all(s().p(context, 30)),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetStarted(),
                            ));
                      },
                      child: PrimaryBouttom(
                        NextWidgetPB: NextWidgetPB,
                        message: mess,
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
