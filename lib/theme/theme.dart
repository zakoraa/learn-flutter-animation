import 'package:flutter/material.dart';
import 'package:flutter_animation/theme/color.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: CustomColor.primaryColor,
      appBarTheme: const AppBarTheme(
          shadowColor: CustomColor.shadowColor,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins")),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"),
        bodyMedium:
            TextStyle(fontSize: 12, color: Colors.black, fontFamily: "Poppins"),
      ),
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: CustomColor.primaryColor, size: 25),
      shadowColor: CustomColor.shadowColor,
      splashColor: CustomColor.shadowColor,
      splashFactory: InkRipple.splashFactory,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(CustomColor.primaryColor),
          elevation: const MaterialStatePropertyAll(0.0),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ));
}
