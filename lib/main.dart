import 'package:custom_cal/screens/clean_menu_screen.dart';
import 'package:flutter/material.dart';

import 'package:custom_cal/data/dog_breed_data.dart';
import 'package:custom_cal/theme/styles.dart';

void main() {
  runApp(CustomCalApp());
}

class CustomCalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Species',
      theme: theme,
      home: CleanMenuScreen(book: dogBreedData),
    );
  }
}
