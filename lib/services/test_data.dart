import 'package:flutter/material.dart';

import '../model/book.dart';
import '../model/section.dart';
import '../model/page.dart';

Book testBook = Book(
  name: 'Snakes vs Cows',
  sections: <Section>[
    Section(
      name: 'First Section',
      label: Icon(Icons.home),
      pages: <Page>[
        Page(
          name: 'First Page',
          content: <Widget>[
            Text('First line'),
            Text('Second line'),
            Text('Third line'),
            Center(
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                height: 300,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
