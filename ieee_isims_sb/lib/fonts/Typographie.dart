import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class Typographie {
  // ignore: non_constant_identifier_names
  static TextStyle H1(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 48), fontWeight: FontWeight.w800);
  }

  // ignore: non_constant_identifier_names
  static TextStyle H2(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 40), fontWeight: FontWeight.w800);
  }

  // ignore: non_constant_identifier_names
  static TextStyle H3(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 36), fontWeight: FontWeight.w700);
  }

  // ignore: non_constant_identifier_names
  static TextStyle H4(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 24), fontWeight: FontWeight.w700);
  }

  // ignore: non_constant_identifier_names
  static TextStyle H5(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 12), fontWeight: FontWeight.w700);
  }

  static TextStyle ActionBouttom(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 16), fontWeight: FontWeight.w700);
  }

  static TextStyle NormalText(BuildContext context) {
    return TextStyle(fontSize: s().p(context, 16), fontWeight: FontWeight.w400);
  }

  static TextStyle Placeholder(BuildContext context) {
    return TextStyle(
        fontSize: s().p(context, 12),
        fontWeight: FontWeight.w500,
        color: Color(0xff838383));
  }

  static TextStyle Body(BuildContext context) {
    return TextStyle(
        fontSize: s().p(context, 12),
        fontWeight: FontWeight.w400,
        color: Color(0xff838383));
  }
}
