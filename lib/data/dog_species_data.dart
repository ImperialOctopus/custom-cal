import 'package:flutter/material.dart';

import '../model/book_data.dart';
import '../model/section_data.dart';
import '../model/page_data.dart';

BookData dogSpeciesData = BookData(
  name: 'Dog Species',
  sections: <SectionData>[
    SectionData(
      name: 'Test',
      label: null,
      color: null,
      pages: <PageData>[
        PageData(
          name: 'Test',
          content: <Widget>[],
        ),
      ],
    ),
  ],
);
