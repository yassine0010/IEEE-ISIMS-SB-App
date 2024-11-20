import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:page_transition/page_transition.dart';

class AboutUsItem extends StatelessWidget {
  final Widget destination;
  final String Title;
  final Color color;
  final String path;
  const AboutUsItem({
    super.key,
    required this.Title,
    required this.color,
    required this.path,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: destination));
      }, //  arguments:         PageTransition(type: PageTransitionType.fade, child: SB())
      child: Container(
        height: s().p(context, 131),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(110, 109, 109, 109),
                  spreadRadius: 1,
                  offset: Offset(3, 3),
                  blurRadius: 3)
            ],
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(s().p(context, 12))),
        child: Padding(
          padding: EdgeInsets.all(s().p(context, 16)),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Title,
                    style: Typographie.H5(context).copyWith(color: color),
                  ),
                ),
                const Spacer(),
                Title == "IEEE Women In Engineering Affinity Group"
                    ? Image.asset(
                        path,
                        width: s().p(context, 76),
                        height: s().p(context, 76),
                      )
                    : SvgPicture.asset(path)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
