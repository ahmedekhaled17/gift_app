import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/color.dart';

ThemeData themEnglish = ThemeData(
  fontFamily: "Montserrat",
  floatingActionButtonTheme:FloatingActionButtonThemeData(backgroundColor: AppColor.primary) ,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primary),
    titleTextStyle:  TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: 25),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppColor.black),
      bodyLarge:const TextStyle(
          height: 2,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14)),
  //brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

ThemeData themArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppColor.black),
      bodyLarge:const TextStyle(
          height: 2,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14)),
  //brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

