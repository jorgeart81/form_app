import 'package:flutter/material.dart';

class AppTheme {
  final _seedColor = Colors.deepPurple;

  ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _seedColor,
    listTileTheme: ListTileThemeData(iconColor: _seedColor),
  );
}
