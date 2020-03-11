import 'package:flutter/material.dart';
import 'package:prototype_cal/extensions/hex_color.dart';
import 'package:prototype_cal/model/book.dart';
import 'package:prototype_cal/model/page.dart';
import 'package:prototype_cal/model/section.dart';
import 'package:xml/xml.dart';

class XmlService {
  static Book loadXmlBook(String input) {
    XmlDocument document;
    try {
      document = parse(input);
    } catch (e) {
      print(e);
    }

    return buildBook(document.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'document',
        orElse: () => null));
  }

  static Book buildBook(XmlElement bookNode) {
    String title = bookNode.children
        .firstWhere(
            (XmlNode node) => node is XmlElement && node.name.local == 'title',
            orElse: () => null)
        ?.text;
    List<Section> sections = bookNode.children
        .where((XmlNode node) =>
            node is XmlElement && node.name.local == 'section')
        .map((XmlNode node) => buildSection(node as XmlElement))
        .toList();

    return Book(name: title, sections: sections);
  }

  static Section buildSection(XmlElement sectionNode) {
    // Get title, if not specified set to an error message
    XmlNode titleNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'title',
        orElse: () => null);
    String title = (titleNode != null) ? titleNode.text : 'No Title Specified';

    // Get label, or if not specified use the first letter of the title
    XmlNode labelNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'label',
        orElse: () => null);
    String labelText = (labelNode != null) ? labelNode.text : title[0];
    Widget label = Text(labelText);

    // Get the colour, or if not specified use white
    XmlNode colorNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'color',
        orElse: () => null);
    String colorString = (colorNode != null) ? colorNode.text : '#FFFFFF';
    Color color;
    try {
      color = HexColor(colorString);
    } catch (_) {
      color = const Color(0xFFFFFFFF);
    }

    // Get whether this section is optional, defaults to false
    XmlNode optionalNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'optional',
        orElse: () => null);
    bool optional =
        (optionalNode != null) ? optionalNode.text == 'true' : false;

    // Get pages
    List<Page> pages = sectionNode.children
        .where(
            (XmlNode node) => node is XmlElement && node.name.local == 'page')
        .map((XmlNode node) => buildPage(node as XmlElement))
        .toList();

    return Section(
      name: title,
      label: label,
      color: color,
      optional: optional,
      pages: pages,
    );
  }

  static Page buildPage(XmlElement pageNode) {
    String title = pageNode.children
        .firstWhere(
            (XmlNode node) => node is XmlElement && node.name.local == 'title',
            orElse: () => null)
        ?.text;
    String note = pageNode.children
        .firstWhere(
            (XmlNode node) => node is XmlElement && node.name.local == 'note',
            orElse: () => null)
        ?.text;
    List<Widget> content = pageNode.children
        .map((XmlNode paragraphNode) => buildParagraph(paragraphNode))
        .where((element) => element != null)
        .toList();

    return Page(
      name: title,
      content: content,
      note: note,
    );
  }

  static Widget buildParagraph(XmlNode paragraphNode) {
    if (paragraphNode is XmlElement) {
      switch (paragraphNode.name.local) {
        case 'paragraph':
          return Text(paragraphNode.text);
          break;
        case 'image':
          return Center(
            child: Image(
              image: NetworkImage(paragraphNode.text),
              height: 300,
              //double.tryParse(paragraphNode.getAttribute('height')) ?? 300,
            ),
          );
          break;
        default:
          return null;
      }
    } else {
      return null;
    }
  }

  static Book test() {
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
    return loadXmlBook(string);
  }
}
