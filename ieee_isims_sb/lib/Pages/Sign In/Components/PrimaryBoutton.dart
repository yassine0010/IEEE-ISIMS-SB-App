import 'package:flutter/material.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class PrimaryBouttom extends StatefulWidget {
  final String message;
  const PrimaryBouttom({super.key, required this.message});

  @override
  State<PrimaryBouttom> createState() => _PrimaryBouttomState();
}

class _PrimaryBouttomState extends State<PrimaryBouttom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: s().p(context, 46),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38), color: primary_col),
          child: Center(
            child: Text(widget.message,
                style:
                    Typographie.ActionBouttom(context).copyWith(color: white)),
          ),
        ))
      ],
    );
  }
}