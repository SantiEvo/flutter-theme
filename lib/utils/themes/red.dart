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
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedIconTheme: IconThemeData(color: Colors.white),
              unselectedLabelStyle: TextStyle(backgroundColor: Colors.red),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.red,
              selectedIconTheme: IconThemeData(color: Colors.black),
              selectedLabelStyle: TextStyle(color: Colors.white)),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red, accentColor: Colors.red, backgroundColor: Colors.red, primaryColorDark: Colors.white)
              .copyWith(secondary: Colors.white)),
    );
  }
}
