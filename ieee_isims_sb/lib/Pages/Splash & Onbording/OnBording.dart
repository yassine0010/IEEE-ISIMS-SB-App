import 'package:animations/animations.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Sign%20In/Sign%20In.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/Components/PrimaryBoutton.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

int currentIndex = 0;
bool islastPage = false;
PageController pageController = PageController();
List<PageItem> item = [
  const PageItem(
    ImagePic: "assets/onBordingImages/ieee_logo.png",
    Title:
        "1. IEEE, or the Institute of Electrical and Electronics Engineers, is the world's largest technical professional organization",
  ),
  const PageItem(
    ImagePic: "assets/onBordingImages/png1.png",
    Title: "2. IEEE's goal is to help technology grow and make life better.",
  ),
  const PageItem(
    ImagePic: "assets/onBordingImages/png2.png",
    Title: "3. over 400,000 members worldwide",
  ),
  const PageItem(
    ImagePic: "assets/onBordingImages/png3.png",
    Title:
        "4. Get access to the latest tech knowledge , important research, and a global network of professionals.",
  ),
];

class _OnbordingState extends State<Onbording>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
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
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            fontSize: s().p(context, 14),
                            color: const Color(0xff838383),
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
              Gap(s().p(context, 24)),
              const Divider(
                color: Color(0xffBfbfbf),
                thickness: 2,
              ),
              Gap(s().p(context, 24)),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                      islastPage = value + 1 == item.length;
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
                  controller: pageController,
                ),
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: 4,
                  position: currentIndex,
                  decorator: DotsDecorator(
                    color: const Color(0xffd9d9d9),
                    activeColor: primary_col,
                  ),
                ),
              ),
              Gap(s().p(context, 16)),
              if (islastPage) ...[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SignIn(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const PrimaryBouttom(
                    message: "Continue",
                  ),
                ),
              ],
              if (islastPage == false) ...[
                GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: const PrimaryBouttom(
                    message: "Next",
                  ),
                ),
              ]
            ],
          ),
        )),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Title;
  // ignore: non_constant_identifier_names
  final String ImagePic;
  const PageItem({
    super.key,
    // ignore: non_constant_identifier_names
    required this.ImagePic,
    // ignore: non_constant_identifier_names
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
