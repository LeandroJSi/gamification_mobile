import 'package:flutter/material.dart';

abstract class TccColors {
  static Color baseColor = const Color(0xff557FEB);
  static Color textColor = const Color(0xff000000);
}

abstract class TccThemes {
  static ThemeData light() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        disabledColor: Colors.grey.shade300,
        drawerTheme: DrawerThemeData(
            backgroundColor: Colors.white,
            scrimColor: Colors.black26.withOpacity(0.5)),
        listTileTheme: ListTileThemeData(textColor: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Color(0xff557FEB)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff557FEB)))),
        appBarTheme: const AppBarTheme(
          color: Color(0xff557FEB),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        colorScheme: const ColorScheme.light(primary: Color(0xff557FEB)),
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 16, fontFamily: 'Poppins', color: Colors.white)));
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xff333333),
      disabledColor: Colors.grey.shade800,
      drawerTheme: DrawerThemeData(
          backgroundColor: Color(0xff333333),
          scrimColor: Colors.black26.withOpacity(0.7)),
      listTileTheme: ListTileThemeData(textColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      appBarTheme: AppBarTheme(
        color: TccColors.baseColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.light(primary: Colors.white),
      textTheme: const TextTheme(
        bodyText2: TextStyle(color: Colors.white),
        headline1:
            TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
      ),
    );
  }
}
