import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xffEFF1FA),
    primaryColorLight: Color(0xffF5F8FF),
    accentColor: Color(0xffEB7A27),
    dividerTheme: DividerThemeData(
      space: 20,
      indent: 30,
      endIndent: 30,
      color: Color(0xffEDF0FB),
      thickness: 1.5,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xff353E5A),
        fontFamily: 'AbrilFatface',
        fontSize: 33,
      ),
    ),
  );
}
