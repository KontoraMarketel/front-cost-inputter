import 'package:flutter/material.dart';

import 'extensions/extensions.dart';

const lightPalette = LightPalette();

final lightTheme = ThemeData(
  extensions: [PaletteExtension(lightPalette)],
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightPalette.accent,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: lightPalette.headers,
    ),
    headlineSmall: TextStyle(fontSize: 20, color: lightPalette.headers),
  ),
);
