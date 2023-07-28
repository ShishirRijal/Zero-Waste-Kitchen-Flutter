import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero_waste_kitchen/utils/utils.dart';

//* getter
ThemeData get theme => _theme;

final _theme = ThemeData(
    primaryColor: const Color(0XFF5A59D6),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Constants.kWhiteColor,
    textTheme: GoogleFonts.montserratTextTheme(),
    // text styles

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
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0XFF5A59D6), secondary: const Color(0XFFFF4701)));
