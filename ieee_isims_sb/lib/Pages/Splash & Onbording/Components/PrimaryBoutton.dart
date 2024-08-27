import 'package:flutter/material.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class PrimaryBouttom extends StatelessWidget {
  final String message;
  final Widget NextWidgetPB;

  const PrimaryBouttom({
    super.key,
    required this.message,
    required this.NextWidgetPB,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NextWidgetPB),
          (Route<dynamic> route) => false, // Remove all existing routes
        );
      },
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Text(
                message,
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: s().p(context, 17)),
              ),
            ),
            height: s().p(context, 46),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38), color: primary_col),
          ))
        ],
      ),
    );
  }
}
