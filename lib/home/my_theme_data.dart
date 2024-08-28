import 'package:flutter/material.dart';
import 'package:news/home/app_colors.dart';


class MyThemeData {

  static final ThemeData LightTheme = ThemeData(

  primaryColor: AppColors.primaryLightColor,

  appBarTheme: AppBarTheme(

  backgroundColor: AppColors.primaryLightColor,

  centerTitle: true,

  shape: const RoundedRectangleBorder(

  borderRadius: BorderRadius.only(
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30)))), // BC

  textTheme: TextTheme(

  titleLarge: TextStyle(

  fontSize: 22,

  fontWeight: FontWeight.bold,
  color: AppColors.whiteColor), // TextStyle

  titleMedium: TextStyle(

  fontSize: 20,

  fontWeight: FontWeight.bold,

  color: AppColors.blackColor), // TextStyle

  titleSmall: TextStyle(

  fontSize: 18,

  fontWeight: FontWeight.bold,
  color: AppColors.blackColor), // TextStyle
  )); // Text Theme, ThemeData
}