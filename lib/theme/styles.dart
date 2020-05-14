import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.grey,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: GoogleFonts.firaSansTextTheme().copyWith(
    bodyText2:
        GoogleFonts.firaSans(textStyle: ThemeData.light().textTheme.bodyText2)
            .copyWith(fontSize: 16),
  ),
);
