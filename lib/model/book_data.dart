import 'package:meta/meta.dart';

import 'section_data.dart';

class BookData {
  final String title;
  final String subtitle;
  final String credit;
  final List<SectionData> sections;

  const BookData({
    @required this.title,
    this.subtitle = '',
    this.credit = '',
    @required this.sections,
  });
}
