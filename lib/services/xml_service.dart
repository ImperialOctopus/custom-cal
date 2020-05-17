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
    // Get title
    var titleNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'title',
        orElse: () => null);
    var title = titleNode?.text;

    // Get label
    var labelNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'label',
        orElse: () => null);
    var label = labelNode?.text;

    // Get the colour, or if not specified use white
    var colorNode = sectionNode.children.firstWhere(
        (XmlNode node) => node is XmlElement && node.name.local == 'color',
        orElse: () => null);
    var colorString = colorNode?.text ?? '#FFFFFF';
    Color color;
    try {
      color = HexColor(colorString);
    } catch (_) {
      color = const Color(0xFFFFFFFF);
    }

    // Get pages
    var pages = sectionNode.children
        .where(
            (XmlNode node) => node is XmlElement && node.name.local == 'page')
        .map((XmlNode node) => _buildPage(node as XmlElement))
        .toList();

    return SectionData(
      title: title,
      icon: null,
      label: label,
      color: color,
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
