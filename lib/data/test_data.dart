import 'package:flutter/material.dart';
import 'package:prototype_cal/components/page/hyperlink.dart';

import '../components/page/web_image.dart';
import '../components/section_controller/section_tab_label.dart';
import '../model/book_data.dart';
import '../model/section_data.dart';
import '../model/page_data.dart';
import '../components/page/note_box.dart';

BookData testBookData = BookData(
  name: 'Snakes vs Cows',
  sections: <SectionData>[
    SectionData(
      name: 'First Section',
      label: SectionTabLabel(
        iconData: Icons.home,
        label: 'Home',
      ),
      color: Colors.orange,
      pages: <PageData>[
        PageData(
          name: 'First Page',
          content: <Widget>[
            Text('First line'),
            Text('Second line'),
            Text('Third line'),
            WebImage(
                url:
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            NoteBox(child: Text('Note')),
          ],
        ),
        PageData(
          name: 'First Page',
          content: <Widget>[
            Text('First li2ne'),
            WebImage(
              url:
                  'https://images.unsplash.com/photo-1583582941679-75e0d4e76f8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
              height: 500,
            ),
            Text('MESSAGE'),
            Text('MESSAGE'),
          ],
        ),
        PageData(
          name: 'Page with a Lady',
          content: <Widget>[
            WebImage(
              url:
                  'https://images.unsplash.com/photo-1583599377295-f1fc27794f30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              height: 600,
            ),
          ],
        ),
        PageData(
          name: 'First 4',
          content: <Widget>[
            Text('Oooooo'),
            Text('Zooom'),
            Text('Outrageous'),
          ],
        ),
        PageData(
          name: 'Owl Again',
          content: <Widget>[
            Text('pppppppppppppppppppppppp'),
            WebImage(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
          ],
        ),
      ],
    ),
    SectionData(
      name: 'Second Section',
      label: SectionTabLabel(
        iconData: Icons.play_arrow,
        label: '2',
      ),
      color: Colors.redAccent,
      pages: <PageData>[
        PageData(
          name: 'First Page',
          content: <Widget>[
            Text('First line'),
            Text('Second line'),
            Hyperlink(
              child: NoteBox(
                child: Text('Back to Start'),
              ),
              section: 0,
              page: 0,
            ),
            Text('Third line'),
          ],
        ),
        PageData(
          name: 'Second Page',
          content: <Widget>[
            Text('First li2ne'),
            Text('Second li2ne'),
            Text('Thi2rd line'),
            WebImage(
              url:
                  'https://images.unsplash.com/photo-1583593185947-363fb444b930?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80',
            ),
          ],
        ),
        PageData(
          name: 'Last Page',
          content: <Widget>[
            Text('Thank you'),
            Text('For playing'),
            Text(
                'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
            WebImage(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
          ],
        ),
      ],
    ),
    SectionData(
      name: 'Second Section',
      label: SectionTabLabel(
        iconData: Icons.pool,
        label: 'Pool',
      ),
      color: Colors.lightGreen,
      pages: <PageData>[
        PageData(
          name: 'Final Section',
          content: <Widget>[
            WebImage(
              url:
                  'https://images.unsplash.com/photo-1583444012262-00185bf33cc6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              height: 700,
            ),
          ],
        ),
      ],
    ),
  ],
);
