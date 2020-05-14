import 'package:flutter/material.dart';
import 'package:prototype_cal/components/page/contents_item.dart';
import 'package:prototype_cal/components/page/hyperlink.dart';
import 'package:prototype_cal/components/page/page_paragraph.dart';
import 'package:prototype_cal/components/page/page_spacer.dart';
import 'package:prototype_cal/components/page/page_title.dart';

import '../components/section_controller/section_tab_label.dart';
import '../model/book_data.dart';
import '../model/section_data.dart';
import '../model/page_data.dart';

final BookData dogSpeciesData = const BookData(
  title: 'Dog Species',
  subtitle: 'Custom CAL App',
  credit: 'Created by Zoey Child',
  sections: [
    SectionData(
      title: 'Introduction',
      color: Colors.red,
      label: SectionTabLabel(
        iconData: Icons.home,
      ),
      pages: [
        PageData(content: [
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
        ]),
        PageData(content: [
          PageTitle(text: 'Contents'),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Hounds')),
          ContentsItem(
            indent: 2,
            section: 2,
            page: 1,
            child: Text('Dachshund'),
          ),
          ContentsItem(
              indent: 2, section: 2, page: 1, child: Text('Greyhound')),
          PageSpacer(),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Working')),
          ContentsItem(
              indent: 2, section: 2, page: 1, child: Text('Dobermann')),
          ContentsItem(
              indent: 2, section: 2, page: 1, child: Text('Great Dane')),
          PageSpacer(),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Terrier')),
          ContentsItem(
              indent: 2, section: 2, page: 1, child: Text('Scottish Terrier')),
          ContentsItem(
              indent: 2,
              section: 2,
              page: 1,
              child: Text('Jack Russel Terrier')),
          PageSpacer(),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Gundog')),
          ContentsItem(
              indent: 2,
              section: 2,
              page: 1,
              child: Text('Labrador Retriever')),
          ContentsItem(
              indent: 2, section: 2, page: 1, child: Text('Cocker Spaniel')),
          PageSpacer(),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Pastoral')),
          ContentsItem(
              indent: 2, section: 2, page: 1, child: Text('Border Collie')),
          ContentsItem(indent: 2, section: 2, page: 1, child: Text('Samoyed')),
          PageSpacer(),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Utility')),
          ContentsItem(indent: 2, section: 2, page: 1, child: Text('Bulldog')),
          ContentsItem(indent: 2, section: 2, page: 1, child: Text('Poodle')),
          PageSpacer(),
          ContentsItem(indent: 1, section: 2, page: 1, child: Text('Toy')),
          ContentsItem(
              indent: 2,
              section: 2,
              page: 1,
              child: Text('Cavalier King Charles Spaniel')),
          ContentsItem(indent: 2, section: 2, page: 1, child: Text('Pug')),
        ]),
      ],
    ),
    SectionData(
      title: 'Hounds',
      color: Colors.orange,
      label: SectionTabLabel(
        label: 'H',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Hounds'),
          PageParagraph(
              text:
                  'Hounds were originally bred to hunt. They are divided into sighthounds and scent hounds based on whether they hunt with sight and speed, or scent and endurance.'),
          PageParagraph(
              text:
                  'Common hounds include Beagles, Dachshunds, Greyhounds, and Whippets.'),
        ]),
      ],
    ),
    SectionData(
      title: 'Working',
      color: Colors.yellow,
      label: SectionTabLabel(
        label: 'W',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Working'),
          PageParagraph(
              text:
                  'Working dogs were bred as guard dogs, or for search and rescue. Familiar working dog breeds are the Dobermann, Newfoundland, and Great Dane.'),
        ]),
      ],
    ),
    SectionData(
      title: 'Terrier',
      color: Colors.green,
      label: SectionTabLabel(
        label: 'T',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Terrier'),
          PageParagraph(
              text:
                  'Terriers were originally bred to hunt vermin both above and below ground. Every terrier has "terrier" at the end of its name! (Not every dog with "terrier" is a terrier though...)'),
        ]),
      ],
    ),
    SectionData(
      title: 'Gundog',
      color: Colors.lightBlue,
      label: SectionTabLabel(
        label: 'G',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Gundog'),
          PageParagraph(
              text:
                  'These were bred to help with shooting; either by finding live game or by retrieving shot and wounded animals.'),
        ]),
      ],
    ),
    SectionData(
      title: 'Pastoral',
      color: Colors.blue,
      label: SectionTabLabel(
        label: 'P',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Pastoral'),
          PageParagraph(
              text:
                  'Pastoral dogs were bred to herd animals including sheep, cattle, and reindeer.'),
        ]),
      ],
    ),
    SectionData(
      title: 'Utility',
      color: Colors.purple,
      label: SectionTabLabel(
        label: 'W',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Utility'),
          PageParagraph(
              text:
                  'The utility group contains breeds bred for a purpose not included in any of the other groups.'),
        ]),
      ],
    ),
    SectionData(
      title: 'Toy',
      color: Colors.pink,
      label: SectionTabLabel(
        label: 'T',
      ),
      pages: [
        PageData(content: [
          PageTitle(text: 'Toy'),
          PageParagraph(text: 'Toy breeds were bred as companion or lap dogs.'),
        ]),
      ],
    ),
  ],
);
