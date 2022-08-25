import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BlueTheme {
  final String id = "custom_theme_1";
  final String description = "My Custom Theme 1";

  getTheme() {
    return AppTheme(
      id: id,
      description: description,
      data: ThemeData(
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(backgroundColor: Colors.blue),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.black)),
    );
  }
}
