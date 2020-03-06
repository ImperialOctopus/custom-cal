import '../model/book.dart';
import '../model/section.dart';
import '../model/page.dart';

Book data = Book(
  name: 'Snakes vs Cows',
  sections: <Section>[
    Section(
      name: 'Opening Section',
      label: '1',
      pages: <Page>[
        Page(
          name: 'First Page',
          content: 'Content of First Page',
        ),
        Page(
          name: 'Second',
          content: 'Content of Second Page',
        ),
      ],
    ),
    Section(
      name: 'Section the Second',
      label: 'B',
      pages: <Page>[],
    ),
    Section(
      name: '3! 3! 3!',
      label: 'T',
      pages: <Page>[],
    )
  ],
);
