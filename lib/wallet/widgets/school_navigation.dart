import 'package:flutter/material.dart';
import 'school_navigation_wrapper.dart';

class SchoolNavigation {
  static void navigate(BuildContext context, int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SchoolNavigationWrapper(initialIndex: index),
      ),
    );
  }
}
