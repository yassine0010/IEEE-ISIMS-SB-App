import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/SplashScreen.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

int currentIndex = 0;
bool islastPage = false;
PageController _pageController = PageController();
List<PageItem> item = [
  PageItem(
    ImagePic: "assets/onBordingImages/ieee_logo.png",
    Title:
        "1. IEEE, or the Institute of Electrical and Electronics Engineers, is the world's largest technical professional organization",
  ),
  PageItem(
    ImagePic: "assets/onBordingImages/png1.png",
    Title: "2. IEEE's goal is to help technology grow and make life better.",
  ),
  PageItem(
    ImagePic: "assets/onBordingImages/png2.png",
    Title: "3. over 400,000 members worldwide",
  ),
  PageItem(
    ImagePic: "assets/onBordingImages/png3.png",
    Title:
        "4. get access to the latest tech knowledge , important research, and a global network of professionals.",
  ),
];

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s().p(context, 16), vertical: s().p(context, 24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("What is IEEE?", style: Typographie.H4(context)),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Splashscreen(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                        fontSize: s().p(context, 14),
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Gap(s().p(context, 24)),
            Divider(
              color: Color(0xffBfbfbf),
              thickness: 2,
            ),
            Gap(s().p(context, 24)),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                  setState(() {
                    if (value + 1 == item.length) {
                      islastPage = true;
                    } else {
                      setState(() {
                        islastPage = false;
                      });
                    }
                  });
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      item[index],
                    ],
                  );
                },
                controller: _pageController,
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 4,
                position: currentIndex,
                decorator: DotsDecorator(
                  color: Color(0xffd9d9d9), // Inactive color
                  activeColor: primary_col,
                ),
              ),
            ),
            Gap(s().p(context, 16)),
            if (islastPage) ...[
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Splashscreen(),
                      ),
                      (route) => false);
                },
                child: PrimaryBouttom2(
                  message: "Continue",
                ),
              ),
            ],
            if (islastPage == false) ...[
              GestureDetector(
                onTap: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: PrimaryBouttom2(
                  message: "Next",
                ),
              ),
            ]
          ],
        ),
      )),
    );
  }
}

class PrimaryBouttom2 extends StatelessWidget {
  final String message;

  const PrimaryBouttom2({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class PageItem extends StatelessWidget {
  final String Title;
  final String ImagePic;
  PageItem({
    super.key,
    required this.ImagePic,
    required this.Title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Title,
            style: Typographie.ActionBouttom(context)
                .copyWith(color: primary_col)),
        Gap(s().p(context, 24)),
        Center(
          child: Image.asset(
            ImagePic,
            height: s().p(context, 250),
          ),
        ),
        Gap(s().p(context, 24)),
      ],
    );
  }
}
