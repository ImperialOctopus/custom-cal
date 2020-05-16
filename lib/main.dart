import 'package:flutter/material.dart';

import 'package:custom_cal/data/dog_species_data.dart';
import 'package:custom_cal/screens/menu_screen.dart';
import 'package:custom_cal/theme/styles.dart';

const bookData = dogSpeciesData;

void main() {
  runApp(CustomCalApp());
}

class CustomCalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: bookData.title,
      theme: theme,
      home: MenuScreen(book: bookData),
    );
  }
}
