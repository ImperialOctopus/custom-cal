import 'package:dog_breeds/components/decoration/app_icon.dart';
import 'package:dog_breeds/model/book_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'book_screen.dart';

class CleanMenuScreen extends StatelessWidget {
  final BookData book;

  const CleanMenuScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              AppIcon(size: 128),
              Text(
                'Dog Breeds',
                style: Theme.of(context).textTheme.headline2,
              ),
              Container(height: 8),
              Text(
                'Created by Zoey Child',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Spacer(),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.book),
                  color: Colors.white,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookScreen(book: book),
                    ),
                  ),
                ),
              ),
              Text('Open Book'),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
