import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundGreyMed = Color.fromRGBO(167, 167, 167, 1);
  static const Color itemBackground = Color(0xffDBDAE0);
  static const Color textformFieldColor = Color(0xffA7A7A7);
  static const Color greenColor = Color.fromRGBO(76, 175, 80, 1);

  //white theme
  static const Color backgroundGrey = Color.fromRGBO(235, 234, 239, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 0);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);

  //dark theme
  static const Color blackColor = Colors.black;
  static const Color backgroundGreyDark = Color.fromRGBO(72, 72, 72, 1);
  static const Color greyCold = Color(0xff707070);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: whiteColor,
    secondaryHeaderColor: blackColor,
    scaffoldBackgroundColor: backgroundGrey,
    cardColor: whiteColor,
    dividerColor: blackColor,
    // colorScheme: ColorScheme.light(
    //   background: Colors.white,
    // ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: blackColor,
    secondaryHeaderColor: whiteColor,
    scaffoldBackgroundColor: backgroundGreyDark,
    dividerColor: whiteColor,
    cardColor: blackColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
