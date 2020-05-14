import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_cal/data/dog_species_data.dart';

import 'package:prototype_cal/screens/menu_screen.dart';
import 'package:prototype_cal/theme/styles.dart';

void main() {
  runApp(CalApp());
}

class CalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(GoogleFonts.firaSansTextTheme());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: MenuScreen(book: dogSpeciesData),
    );
  }
}
