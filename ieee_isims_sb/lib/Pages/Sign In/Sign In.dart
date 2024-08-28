import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Layout/Layout.dart';
import 'package:ieee_isims_sb/Pages/Sign%20In/Components/PrimaryBoutton.dart';
import 'package:ieee_isims_sb/Pages/Sign%20In/Components/SecondaryBoutton.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

bool ischecked = true;
bool isobsecure = true;

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final _formLoginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/BackgroundImage.png"))),
          child: SafeArea(
            child: Column(
              children: [
                Gap(s().p(context, 40)),
                Text("Welcome Back!",
                    style: Typographie.H4(context).copyWith(color: white)),
                Gap(s().p(context, 30)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formLoginkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("IEEE Email",
                                style: Typographie.H5(context)
                                    .copyWith(color: black)),
                            Gap(s().p(context, 8)),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {},
                              decoration: InputDecoration(
                                hintStyle: Typographie.Placeholder(context),
                                hintText: "Enter your Email",
                              ),
                            ),
                            Gap(s().p(context, 20)),
                            Text("IEEE Password",
                                style: Typographie.H5(context)
                                    .copyWith(color: black)),
                            Gap(s().p(context, 8)),
                            TextFormField(
                              obscureText: isobsecure,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {},
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isobsecure = !isobsecure;
                                      });
                                    },
                                    icon: isobsecure
                                        ? LineIcon.eyeSlash()
                                        : LineIcon.eye()),
                                hintStyle: Typographie.Placeholder(context),
                                hintText: "Enter Your Password",
                              ),
                            ),
                            Gap(s().p(context, 20)),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    activeColor: primary_col,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: ischecked,
                                    onChanged: (value) {
                                      setState(() {
                                        ischecked = !ischecked;
                                      });
                                    },
                                  ),
                                ),
                                Gap(s().p(context, 8)),
                                Text(
                                  "Remember me",
                                  style: Typographie.H5(context),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(s().p(context, 36)),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: const BorderRadius.only(
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
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: LayoutPage()));
                                  },
                                  child: PrimaryBouttom(
                                    message: "Sign In",
                                  )),
                              Gap(s().p(context, 12)),
                              Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  Gap(s().p(context, 12)),
                                  const Text(
                                    "Or",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff333333)),
                                  ),
                                  Gap(s().p(context, 12)),
                                  const Expanded(child: Divider())
                                ],
                              ),
                              Gap(s().p(context, 12)),
                              GestureDetector(
                                child: SecondaryBoutton(
                                  message: "Continue As A Visitor",
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LayoutPage(),
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
