import 'package:flutter/material.dart';

import '../components/page/local_image.dart';
import '../components/section_controller/section_tab_label.dart';
import '../model/book_data.dart';
import '../model/section_data.dart';
import '../model/page_data.dart';

BookData dogSpeciesData = BookData(
  title: 'Dog Species',
  subtitle: 'Custom CAL App',
  credit: 'Created by Zoey Child',
  sections: <SectionData>[
    SectionData(
      name: 'Dog Species',
      label: SectionTabLabel(
        iconData: Icons.home,
        label: 'Home',
      ),
      color: Colors.orange,
      pages: <PageData>[
        PageData(
          name: 'Test',
          content: <Widget>[
            LocalImage(location: 'assets/images/bulldog.jpg'),
          ],
        ),
      ],
    ),
  ],
);
