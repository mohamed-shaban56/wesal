import 'package:flutter/material.dart';

class IndexValueNotifier {
  static ValueNotifier<int> indexValueNotifier = ValueNotifier(0);
  static int setIndex(int currentIndex) {
    return indexValueNotifier.value = currentIndex;
  }
}
