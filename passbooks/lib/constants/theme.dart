
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF00ADEE);
const kPrimaryLightColor = Color(0xFFE3F2FD);

final ThemeData appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Color(0xfff9f9f9),
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: kPrimaryColor),
  ),
);

const TextStyle alertDialogTitleStyle = TextStyle(
  fontFamily: 'DBHeavent',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  letterSpacing: 0.42,
);

const TextStyle alertDialogContentStyle = TextStyle(
  fontFamily: 'DBHeavent',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  letterSpacing: 0.42,
);

const TextStyle alertDialogButtonStyle = TextStyle(
  fontFamily: 'DBHeavent',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  letterSpacing: 0.42,
);

