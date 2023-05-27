import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color/flutter_color.dart';

 const defaultColor = Colors.orange;
ThemeData? darkTheme = ThemeData(


    dialogBackgroundColor: HexColor('#333739'),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(width: 1.0, color: Colors.white),)
    ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(

      ),
    drawerTheme: DrawerThemeData(
      backgroundColor: HexColor('#333739'),
    ),
    fontFamily: "cairo",
    primarySwatch: defaultColor,
    textTheme:   const TextTheme(
      subtitle1: TextStyle(

          fontSize: 14,
          color:Colors.white,
          fontWeight: FontWeight.w300,
          height: 1.3

      ),
      bodyText1:  TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyText2:  TextStyle(
        color: Colors.white,
        fontSize: 12,
        height: 1.4,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
          color: Colors.grey,
          fontSize: 12
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),



    ),
    cardColor: HexColor('#333739'),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      backgroundColor: HexColor('#333739'),
      unselectedItemColor: Colors.white,
    ),
    scaffoldBackgroundColor: HexColor('#333739'),
    appBarTheme: AppBarTheme(
        iconTheme:   const IconThemeData(
          color: Colors.white,
        ),
        color: HexColor('#333739'),
        elevation: 0,


        //backwardsCompatibility: false,
        titleTextStyle:  const TextStyle(
            fontFamily: "cairo",
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ) ,
        systemOverlayStyle:   const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light

        )
    )
);

ThemeData? lightTheme = ThemeData(

    floatingActionButtonTheme: FloatingActionButtonThemeData(
    ),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(width: 1.0, color: Colors.grey),)
    ),
    fontFamily: "cairo",
    primarySwatch: defaultColor,
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        fontSize: 14,
        color:Colors.black,
        fontWeight: FontWeight.w300,
        height: 1.3,
        fontFamily: "cairo",
      ),
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 12,
        height: 1.4,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),


    ),
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,

    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:   const AppBarTheme(

        iconTheme:  IconThemeData(
          color: Colors.black,
        ),
        color: Colors.white,
        titleTextStyle:  TextStyle(
            color: Colors.black
        ),
        elevation: 0,
        // backwardsCompatibility: false,


        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark

        )
    )
);