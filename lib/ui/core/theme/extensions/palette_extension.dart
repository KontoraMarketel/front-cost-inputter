import 'package:flutter/material.dart';

abstract interface class Palette {
  Color get background;

  Color get accent;

  Color get headers;

  Color get success;

  Color get warning;

  Color get error;

  Color get card;
}

class LightPalette implements Palette {
  const LightPalette();

  @override
  Color get accent => Color(0xFF3498DB);

  @override
  Color get background => Color(0xFFFFFFFF);

  @override
  Color get card => Color(0xFFECF0F1);

  @override
  Color get error => Color(0xFFE74C3C);

  @override
  Color get headers => Color(0xFF2C3E50);

  @override
  Color get success => Color(0xFF27AE60);

  @override
  Color get warning => Color(0xFFF39C12);
}

class PaletteExtension extends ThemeExtension<PaletteExtension> {
  final Palette palette;

  PaletteExtension(this.palette);

  @override
  ThemeExtension<PaletteExtension> copyWith() => this;

  @override
  ThemeExtension<PaletteExtension> lerp(
    covariant ThemeExtension<PaletteExtension>? other,
    double t,
  ) => this;
}
