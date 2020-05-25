import 'package:dog_breeds/components/decoration/shadow_decoration.dart';
import 'package:dog_breeds/model/book_data.dart';
import 'package:flutter/material.dart';

import 'book_screen.dart';

class MenuScreen extends StatelessWidget {
  final BookData book;

  const MenuScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            decoration: ShadowDecoration.decoration,
            child: Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      book.title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Text(
                    book.subtitle,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    book.credit,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  RaisedButton(
                    child: Text('Start'),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookScreen(book: book),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
