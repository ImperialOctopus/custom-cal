import 'package:meta/meta.dart';
import 'section.dart';

class Book {
  final String name;
  final List<Section> sections;

  const Book({@required this.name, @required this.sections});
}
