import 'package:flutter/material.dart';
import 'package:prototype_cal/model/bookmark.dart';

abstract class ISpreadComponent extends StatelessWidget {
  Bookmark get bookmark;
  Function(int) get onSectionPressed;
  Function get onForwardPressed;
  Function get onBackPressed;
}
