import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsPage.dart';
import 'package:ieee_isims_sb/Pages/AboutUsPage/AboutUsSubPage/SB.dart';
import 'package:ieee_isims_sb/Pages/HomePages/AddPostPage.dart';
import 'package:ieee_isims_sb/Pages/HomePages/HomePage.dart';
import 'package:ieee_isims_sb/Pages/ProfilePage/ProfilePage.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class LayoutPage extends StatefulWidget {
  final bool? isvisitor;
  LayoutPage({super.key, this.isvisitor});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  late PersistentTabController _controller;
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;
  @override
  void initState() {
    super.initState();
    int index = 0;

    if (widget.isvisitor != null && widget.isvisitor==true) {
      index = 2;
    }
    _controller = PersistentTabController(initialIndex: index);
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();

    _scrollController3 = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),

          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset:
              false, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardAppears: true,
          padding: const EdgeInsets.all(8),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: s().p(context, 70),
          navBarStyle:
              NavBarStyle.style6, // Choose the nav bar style with this property
        ));
  }

  List<Widget> _buildScreens() {
    print("object");
    print(widget.isvisitor);
    return [
      Homepage(
        isvisitor: widget.isvisitor,
      ),
      Profilepage(),
      AboutUsPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: Typographie.H5(context),
        inactiveColorSecondary: black,
        inactiveIcon: SvgPicture.asset(
          "assets/svg/menu_icons/li_home.svg",
          color: black,
        ),
        icon: SvgPicture.asset(
          "assets/svg/menu_icons/li_home.svg",
          height: s().p(context, 24),
          width: s().p(context, 24),
        ),
        scrollController: _scrollController1,
        activeColorPrimary: primary_col,
        inactiveColorPrimary: black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/AddPage": (final context) => Addpostpage(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        textStyle: Typographie.H5(context),
        inactiveColorSecondary: black,
        inactiveIcon: SvgPicture.asset(
          "assets/svg/menu_icons/li_user.svg",
          color: black,
        ),
        icon: SvgPicture.asset(
          color: primary_col,
          "assets/svg/menu_icons/li_user.svg",
          height: s().p(context, 24),
          width: s().p(context, 24),
        ),
        scrollController: _scrollController2,
        activeColorPrimary: primary_col,
        inactiveColorPrimary: black,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        textStyle: Typographie.H5(context),
        inactiveColorSecondary: black,
        inactiveIcon: SvgPicture.asset(
          "assets/svg/menu_icons/li_about.svg",
          color: black,
        ),
        icon: SvgPicture.asset(
          color: primary_col,
          "assets/svg/menu_icons/li_about.svg",
          height: s().p(context, 24),
          width: s().p(context, 24),
        ),
        scrollController: _scrollController3,
        activeColorPrimary: primary_col,
        inactiveColorPrimary: black,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/SB": (final context) => const SB(),
          },
        ),
      ),
    ];
  }
}
