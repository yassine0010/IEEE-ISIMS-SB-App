import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.black,
                selectionHandleColor: Color.fromARGB(255, 130, 130, 130),
                selectionColor: Color.fromARGB(255, 255, 220, 168)),
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 1.2, color: Color(0xff828282))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.2))),
            primaryColor: Colors.black,
            textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
