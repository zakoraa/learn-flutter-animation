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
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: CustomColor.primaryColor, size: 25),
      shadowColor: CustomColor.shadowColor,
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
