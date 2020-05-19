import 'package:flutter/material.dart';

import 'package:custom_cal/data/dog_species_data.dart';
import 'package:custom_cal/theme/styles.dart';

import 'screens/new_menu_screen.dart';

void main() {
  runApp(CustomCalApp());
}

class CustomCalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomCAL Dog',
      theme: theme,
      home: NewMenuScreen(book: dogSpeciesData),
    );
  }
}
