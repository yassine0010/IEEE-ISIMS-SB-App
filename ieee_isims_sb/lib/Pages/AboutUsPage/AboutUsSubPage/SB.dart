import 'package:flutter/material.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';

class SB extends StatefulWidget {
  const SB({super.key});

  @override
  State<SB> createState() => _SBState();
}

class _SBState extends State<SB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "data",
        style: Typographie.H3(context),
      )),
    );
  }
}
