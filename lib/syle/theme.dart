import 'package:flutter/material.dart';
import './colors.dart';
//import 'package:login_flutter_app/src/utils/theme/widget_themes/text_theme.dart';

class AppTheme {
  AppTheme._();


  static ThemeData lightTheme = ThemeData(
    //primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    //textTheme: TTextTheme.lightTextTheme,
    fontFamily: 'AlegreyaSans',
    scaffoldBackgroundColor: AppColor.backgroundBlue,
  );


  static ThemeData darkTheme = ThemeData(
    //primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    fontFamily: 'AlegreyaSans',
    scaffoldBackgroundColor: AppColor.backgroundBlack,
    //textTheme: TTextTheme.darkTextTheme,
  );
}