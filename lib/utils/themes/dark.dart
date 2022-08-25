import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class DartTheme {
  final String id = "custom_theme_2";
  final String description = "My Custom Theme 2";

  getTheme() {
    return AppTheme(
      id: id,
      description: description,
      data: ThemeData.dark()
    );
  }
}
