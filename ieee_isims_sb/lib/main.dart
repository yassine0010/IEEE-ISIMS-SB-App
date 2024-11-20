import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/Splash%20&%20Onbording/SplashScreen.dart';
import 'package:ieee_isims_sb/Providers/ProfileProvider.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: primary_col,
                selectionHandleColor: primary_col,
                selectionColor: const Color.fromARGB(255, 144, 161, 205)),
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(s().p(context, 12)),
                    borderSide:
                        const BorderSide(width: 1.2, color: Color(0xff828282))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(s().p(context, 12)),
                    borderSide: BorderSide(color: primary_col, width: 1.2))),
            primaryColor: Colors.black,
            textTheme: GoogleFonts.poppinsTextTheme()),
        debugShowCheckedModeBanner: false,
        home: const Splashscreen(),
      ),
    );
  }
}
