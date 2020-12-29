import 'package:dog_breeds/screens/clean_menu_screen.dart';
import 'package:flutter/material.dart';

import 'package:dog_breeds/data/dog_breed_data.dart';
import 'package:dog_breeds/theme/styles.dart';

void main() {
  runApp(CustomCalApp());
}

class CustomCalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Breeds',
      theme: theme,
      home: CleanMenuScreen(book: dogBreedData),
    );
  }
}
