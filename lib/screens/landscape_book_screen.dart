import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_component.dart';
import 'package:prototype_cal/components/two_page_spread_component.dart';
import 'package:prototype_cal/model/book.dart';
import 'package:prototype_cal/model/page.dart';

class LandscapeBookScreen extends StatefulWidget {
  final EdgeInsetsGeometry padding = const EdgeInsets.all(16);
  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  final Book book;

  const LandscapeBookScreen({@required this.book});

  @override
  State<StatefulWidget> createState() => _LandscapeBookScreenState();
}

class _LandscapeBookScreenState extends State<LandscapeBookScreen> {
  int activeSection = 0;
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: TwoPageSpreadComponent(
          sectionSelect: SectionSelectComponent(
            sections: widget.book.sections,
            activeSection: activeSection,
            onSectionTapped: setSection,
            tabHeight: widget.tabHeight,
            tabWidth: widget.tabWidth,
            tabSpacing: widget.tabSpacing,
            inset: widget.tabsInset,
          ),
          leftPage: getPage(activePage),
          rightPage: getPage(activePage + 1),
          onBackPressed: pageBack,
          onForwardPressed: pageForward,
        ),
      ),
    );
  }

  Page getPage(int index) {
    if (index < widget.book.sections[activeSection].pages.length) {
      return widget.book.sections[activeSection].pages[index];
    } else {
      return null;
    }
  }

  void pageForward() {
    setState(() {
      activePage += 2;
      if (activePage > widget.book.sections[activeSection].pages.length - 1) {
        activePage = widget.book.sections[activeSection].pages.length - 1;
      }
    });
  }

  void pageBack() {
    setState(() {
      activePage -= 2;
      if (activePage < 0) {
        activePage = 0;
      }
    });
  }

  void setSection(int newSection) {
    setState(() {
      activeSection = newSection;
      activePage = 0;
    });
  }
}
