import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class LightTheme {
  final String id = "custom_theme_3";
  final String description = "My Custom Theme 3";

  getTheme() {
    return AppTheme(
      id: id,
      description: description,
      data: ThemeData.light()
    );
  }
}
