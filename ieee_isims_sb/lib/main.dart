import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: primary_col,
                selectionHandleColor: primary_col,
                selectionColor: const Color.fromARGB(255, 144, 161, 205)),
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 1.2, color: Color(0xff828282))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary_col, width: 1.2))),
            primaryColor: Colors.black,
            textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
