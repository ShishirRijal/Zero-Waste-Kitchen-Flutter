import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

//* getter
ThemeData get theme => _theme;

final _theme = ThemeData(
    primaryColor: const Color(0XFF5A59D6),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Constants.kWhiteColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        size: 30,
        color: Colors.black,
      ),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,

    // text styles
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.lato(
          fontSize: 36,
          fontWeight: FontWeight.w500,
          height: 1,
          color: Constants.kBlackColor),
    ),

    //textfield
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Constants.kTextField,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        //removes the border of field
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      hintStyle: TextStyle(
        color: Constants.kGrey,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Constants.kPrimaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Constants.kWhiteColor),
        ),
        alignment: Alignment.center,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0XFF5A59D6), secondary: const Color(0XFFFF4701)));
