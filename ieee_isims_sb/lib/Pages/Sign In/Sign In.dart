import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Layout/Layout.dart';
import 'package:ieee_isims_sb/Pages/Sign%20In/Components/PrimaryBoutton.dart';
import 'package:ieee_isims_sb/Pages/Sign%20In/Components/SecondaryBoutton.dart';
import 'package:ieee_isims_sb/Services/AuthService.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

bool ischecked = true;
bool isobsecure = true;
TextEditingController EmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();
bool _isAuthenticated = false;

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final _formLoginkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    _checkAuthentication();
  }

  bool isloading = true;

  Future<void> _checkAuthentication() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isvisitor = prefs.getBool("isvisitor") ?? false;

    if (isvisitor == true) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: LayoutPage(
            isvisitor: isvisitor,
          ),
        ),
      );
    }

    final isAuthenticated = await login(EmailController, PasswordController);
    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: LayoutPage(
            isvisitor: false,
          ),
        ),
      );
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage("assets/images/BackgroundImage.png"))),
                child: SafeArea(
                  child: Column(
                    children: [
                      Gap(s().p(context, 40)),
                      Text("Welcome Back!",
                          style:
                              Typographie.H4(context).copyWith(color: white)),
                      Gap(s().p(context, 30)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(24)),
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
                                    controller: EmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return "Please write Your Email";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintStyle:
                                          Typographie.Placeholder(context),
                                      hintText: "Enter your Email",
                                    ),
                                  ),
                                  Gap(s().p(context, 20)),
                                  Text("IEEE Password",
                                      style: Typographie.H5(context)
                                          .copyWith(color: black)),
                                  Gap(s().p(context, 8)),
                                  TextFormField(
                                    controller: PasswordController,
                                    obscureText: isobsecure,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return "Please write Your Email";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isobsecure = !isobsecure;
                                            });
                                          },
                                          icon: isobsecure
                                              ? const LineIcon.eyeSlash()
                                              : const LineIcon.eye()),
                                      hintStyle:
                                          Typographie.Placeholder(context),
                                      hintText: "Please Enter Your Password",
                                    ),
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
                                        onTap: () async {
                                          if (_formLoginkey.currentState!
                                              .validate()) {
                                            final isAuthenticated = await login(
                                                EmailController,
                                                PasswordController);
                                            if (isAuthenticated) {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child: LayoutPage(
                                                    isvisitor: false,
                                                  ),
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    content: Text(
                                                        'Login successful')),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content:
                                                        Text('Login failed')),
                                              );
                                            }
                                          }
                                        },
                                        child: const PrimaryBouttom(
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
                                      onTap: () async {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setBool("isvisitor", true);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LayoutPage(
                                                isvisitor: true,
                                              ),
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
