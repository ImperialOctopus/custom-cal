import 'package:flutter/material.dart';
import 'package:prototype_cal/components/section_select_component.dart';
import 'package:prototype_cal/model/book.dart';
import 'package:prototype_cal/model/page.dart';

class LandscapeBookScreen extends StatelessWidget {
  final EdgeInsetsGeometry padding = const EdgeInsets.all(16);
  final double tabHeight = 48;
  final double tabWidth = 48;
  final double tabSpacing = 4;
  final double tabsInset = 16;

  final Book book;

  const LandscapeBookScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: 
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
          showForwardButton: showForwardButton,
          showBackButton: showBackButton,
          onBackPressed: pageBack,
          onForwardPressed: pageForward,
        ),
      ),
    );
  }

}
