import 'package:flutter/material.dart';

import 'app_color.dart';

const String fontFamily = 'Inter';
const Color textColor = Colors.black;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semibold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

class AppTextStyle {
  static TextStyle h1Regular = const TextStyle(
    fontSize: 60,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h2Regular = const TextStyle(
    fontSize: 44,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h3Regular = const TextStyle(
    fontSize: 32,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h4Regular = const TextStyle(
    fontSize: 24,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h5Regular = const TextStyle(
    fontSize: 18,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h6Regular = const TextStyle(
    fontSize: 16,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle pRegular = const TextStyle(
    fontSize: 14,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle sRegular = const TextStyle(
    fontSize: 12,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle xsRegular = const TextStyle(
    fontSize: 11,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle xssRegular = const TextStyle(
    fontSize: 9,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle xsMedium = const TextStyle(
    fontSize: 11,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle sMedium = const TextStyle(
    fontSize: 12,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h4SemiBold = const TextStyle(
    fontSize: 24,
    fontWeight: semibold,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle pSemiBold = const TextStyle(
    fontSize: 14,
    fontWeight: semibold,
    // fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle xsSemiBold = const TextStyle(
    fontSize: 11,
    fontWeight: semibold,
    // fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle xssSemiBold = const TextStyle(
    fontSize: 9,
    fontWeight: semibold,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle h5SemiBold = const TextStyle(
    fontSize: 18,
    fontWeight: semibold,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle pMedium = const TextStyle(
    fontSize: 14,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: textColor,
  );
  static TextStyle xssMedium = const TextStyle(
    fontSize: 9,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: textColor,
  );

  static const TextStyle sSemiBold = TextStyle(
    color: textColor,
    fontSize: 12,
    fontFamily: fontFamily,
    fontWeight: semibold,
  );
  static const TextStyle h5semiBold = TextStyle(
    color: textColor,
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: semibold,
  );
  static const TextStyle orderNumberStyle = TextStyle(
    color: textColor,
    fontSize: 20,
    fontFamily: fontFamily,
    fontWeight: semibold,
  );
  static const TextStyle h6SemiBold = TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: fontFamily,
    fontWeight: semibold,
  );

  static const TextStyle h5Bold = TextStyle(
    color: textColor,
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: bold,
  );
}
