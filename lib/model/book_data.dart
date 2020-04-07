import 'package:meta/meta.dart';
import 'section_data.dart';

class BookData {
  final String name;
  final List<SectionData> sections;

  const BookData({@required this.name, @required this.sections});
}
