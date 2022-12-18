import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class MyThemeData{
  /*static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: greenBackground,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: greenBackground,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: greenBackground,
      onBackground: primaryColor,
      surface: Colors.grey,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
      subtitle1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor,),
      subtitle2: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: colorgreen,),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkPrimary,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: greenBackground,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: greenBackground,
      onBackground: primaryColor,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
      subtitle1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor,),
      subtitle2: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: colorgreen,),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bottomdark,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
  );*/

  static ThemeData darkThem = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkmodeColor,
    primaryColor: defaultDarkColor,
    primarySwatch: defaultLightColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: darkmodeColor,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.white),
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkmodeColor,
          statusBarIconBrightness: Brightness.light,
        )),
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: defaultDarkColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkmodeColor.withOpacity(0.8),
        selectedItemColor: defaultDarkColor,
        unselectedItemColor: Colors.grey.withOpacity(0.6)),

    //NOTE : set default bodytext1
   /* textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
      headline5:
      TextStyle(color: defaultDarkColor, fontWeight: FontWeight.bold),
    ),*/
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
      subtitle1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: defaultLightColor,),
      subtitle2: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: colorgreen,),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: defaultLightColor,
    primarySwatch: defaultLightColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 10),
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: defaultLightColor),

    //NOTE : set default bodytext1
  /*  textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
          color: Colors.black,
        ),
        subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        headline5:
        TextStyle(color: defaultLightColor, fontWeight: FontWeight.bold)),*/
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
      subtitle1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: defaultLightColor,),
      subtitle2: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: colorgreen,),
    ),
  );
}