import 'package:prototype_cal/model/book.dart';
import 'package:xml/xml.dart';

class XmlService {
  static List<Book> parseXml(String input) {
    final XmlDocument document = parse(input);

    final List<Book> books = <Book>[];

    for (XmlNode node in document.children) {
      if (node is XmlElement && node.name.local == 'document') {
        books.add(buildBook(node));
      }
    }

    return books;
  }

  static Book buildBook(XmlNode document) {}

  static void test() {
    String string = '''
<?xml version="1.0"?>
<document>
    <title>Snakes Versus Cows: A Balanced View</title>
    <section>
        <title>Appearance</title>
        <color>#DDDDDD"</color>
        <optional>false</optional>
        <page>
            <title>Colour</title>
            <paragraph>Snakes and cows are both creatures that come in a variety of colours.</paragraph>
            <paragraph>Snakes have the most colours and are therefore the best.</paragraph>
            <note>Remember the 3C rule: Cows aren't Colourful enough to Consider</note>
        </page>
        <page>
            <title>Number of Legs</title>
            <paragraph>Cows: approximately 4 legs</paragraph>
            <paragraph>Snakes: approximately 0 legs</paragraph>
            <paragraph>Regarding leg number, cows are the clear winner with a lead of around 4.0 legs!</paragraph>
        </page>
    </section>
    <section>
        <title>Milk</title>
        <color>#FF0044"</color>
        <optional>false</optional>
        <page>
            <title>Process of Milking</title>
            <paragraph>On this issue, the two sides are perfectly balanced.</paragraph>
            <note>As all things should be!</note>
        </page>
    </section>
</document>
''';
    parseXml(string);
  }
}
