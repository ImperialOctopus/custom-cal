import 'package:flutter/material.dart';

import '../components/page/local_image.dart';
import '../components/section_controller/section_tab_label.dart';
import '../model/book_data.dart';
import '../model/section_data.dart';
import '../model/page_data.dart';

final BookData dogSpeciesData = const BookData(
  title: 'Dog Species',
  subtitle: 'Custom CAL App',
  credit: 'Created by Zoey Child',
  sections: <SectionData>[
    SectionData(
      name: 'Introduction',
      label: SectionTabLabel(
        iconData: Icons.home,
        label: 'Introduction',
      ),
      color: Colors.red,
      pages: <PageData>[
        PageData(
          content: <Widget>[
            LocalImage(location: 'assets/images/bulldog.jpg'),
          ],
        ),
      ],
    ),
  ],
);
