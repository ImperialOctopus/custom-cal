import 'package:flutter/material.dart';
import 'package:prototype_cal/components/page/hyperlink.dart';
import 'package:prototype_cal/components/page/page_paragraph.dart';
import 'package:prototype_cal/components/page/page_title.dart';

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
      title: 'Introduction',
      color: Colors.red,
      label: SectionTabLabel(
        iconData: Icons.home,
      ),
      pages: <PageData>[
        PageData(
          content: <Widget>[
            PageTitle(text: 'Introduction'),
            PageParagraph(
                text:
                    'This is a computer-assisted learning activity created to help familiarise you with different breeds of dog.'),
            PageParagraph(
                text:
                    'By the end of this activity, you will have read a little about every breed recognised by the Kennel Club and seen some accompanying pictures. You shouldn\'t aim to immediately memorise all the information provided here; focus on the most common breeds and refer back to this activity in the future for more specific information on lesser-known breeds.'),
            PageParagraph(
                text:
                    'Dog breeds can be divided into seven broad categories based on what purpose they were originally bred for. Each section in this activity will give some background information on a breed category and then list the dogs included in it.'),
          ],
        ),
        PageData(
          content: <Widget>[
            PageTitle(text: 'Contents'),
            Hyperlink(
              section: 2,
              page: 1,
              child: Text('Hounds'),
            ),
          ],
        ),
      ],
    ),
  ],
);
