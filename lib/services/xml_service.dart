import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import '../extensions/hex_color.dart';
import '../model/book_data.dart';
import '../model/section_data.dart';
import '../model/page_data.dart';

class XmlService {
  static BookData parseBookXml(String input) {
    XmlDocument document;
    try {
      document = parse(input);
    } catch (e) {
      print(e);
    }

    return _buildBook(document.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'document',
        orElse: () => null));
  }

  static BookData _buildBook(XmlElement bookNode) {
    var title = bookNode.children
        .firstWhere(
            (XmlNode node) => node is XmlElement && node.name.local == 'title',
            orElse: () => null)
        ?.text;
    var sections = bookNode.children
        .where((XmlNode node) =>
            node is XmlElement && node.name.local == 'section')
        .map((XmlNode node) => _buildSection(node as XmlElement))
        .toList();

    return BookData(title: title, sections: sections);
  }

  static SectionData _buildSection(XmlElement sectionNode) {
    // Get label, or if not specified use the first letter of the title
    var labelNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'label',
        orElse: () => null);
    var labelText = (labelNode != null) ? labelNode.text : '';
    Widget label = Text(labelText);

    // Get the colour, or if not specified use white
    var colorNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'color',
        orElse: () => null);
    var colorString = (colorNode != null) ? colorNode.text : '#FFFFFF';
    Color color;
    try {
      color = HexColor(colorString);
    } catch (_) {
      color = const Color(0xFFFFFFFF);
    }

    // Get whether this section is optional, defaults to false
    var optionalNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'optional',
        orElse: () => null);
    var optional = (optionalNode != null) ? optionalNode.text == 'true' : false;

    // Get pages
    var pages = sectionNode.children
        .where(
            (XmlNode node) => node is XmlElement && node.name.local == 'page')
        .map((XmlNode node) => _buildPage(node as XmlElement))
        .toList();

    return SectionData(
      label: label,
      color: color,
      optional: optional,
      pages: pages,
    );
  }

  static PageData _buildPage(XmlElement pageNode) {
    var content = pageNode.children
        .map((XmlNode paragraphNode) => _buildParagraph(paragraphNode))
        .where((element) => element != null)
        .toList();

    return PageData(
      content: content,
    );
  }

  static Widget _buildParagraph(XmlNode paragraphNode) {
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
}
