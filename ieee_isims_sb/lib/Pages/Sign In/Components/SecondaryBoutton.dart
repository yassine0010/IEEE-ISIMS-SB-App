import 'package:flutter/material.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class SecondaryBoutton extends StatefulWidget {
  final String message;
  SecondaryBoutton({super.key, required this.message});

  @override
  State<SecondaryBoutton> createState() => _SecondaryBouttonState();
}

class _SecondaryBouttonState extends State<SecondaryBoutton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: s().p(context, 46),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: primary_col),
              borderRadius: BorderRadius.circular(38),
              color: white),
          child: Center(
            child: Text(widget.message,
                style: Typographie.ActionBouttom(context)
                    .copyWith(color: primary_col)),
          ),
        ))
      ],
    );
  }
}
