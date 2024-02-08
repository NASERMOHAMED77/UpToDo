import 'package:firebase_core/firebase_core.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/core/utils/local_shared_pref.dart';
import 'package:firee/pages/home/home.dart';
import 'package:firee/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheLocal.sharedPrefInt();
  token = CacheLocal.getDataFromCache(key: 'token');
  selectedImage = CacheLocal.getDataFromCache(key: 'image');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: Color(0xff979797),
    ));
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeColors.primary,
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: GoogleFonts.latoTextTheme(),
        datePickerTheme: DatePickerThemeData(
            cancelButtonStyle: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            confirmButtonStyle: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor:
                    MaterialStatePropertyAll(ThemeColors.secondary)),
            backgroundColor: ThemeColors.third,
            dayForegroundColor: const MaterialStatePropertyAll(Colors.white),
            headerForegroundColor: (Colors.white),
            yearBackgroundColor: const MaterialStatePropertyAll(Colors.white),
            dayBackgroundColor:
                const MaterialStatePropertyAll(Color(0xff272727))),
        timePickerTheme: TimePickerThemeData(
            backgroundColor: ThemeColors.third,
            hourMinuteTextColor: Colors.white,
            dayPeriodTextColor: Colors.white,
            dayPeriodColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.selected)
                    ? ThemeColors.secondary
                    : ThemeColors.third),
            helpTextStyle: const TextStyle(color: Colors.white),
            cancelButtonStyle: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            confirmButtonStyle: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor:
                    MaterialStatePropertyAll(ThemeColors.secondary)),
            entryModeIconColor: Colors.white,
            hourMinuteColor: const Color(0xff272727)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(ThemeColors.secondary),
              textStyle: const MaterialStatePropertyAll(TextStyle(
                color: Colors.white,
              )),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(15),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          outlineBorder: BorderSide(
            width: .8,
            color: Colors.grey,
          ),
          hintStyle: TextStyle(
            color: Color(0xff535353),
          ),
        ),
      ),
      home: token == '' ? SplashScreen() : HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
