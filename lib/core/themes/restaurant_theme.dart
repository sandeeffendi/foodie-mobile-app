import "package:flutter/material.dart";

///Export MaterialTheme from Material theme builder
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff79590c),
      surfaceTint: Color(0xff79590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdea2),
      onPrimaryContainer: Color(0xff5c4200),
      secondary: Color(0xff6c5c3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff6e0bb),
      onSecondaryContainer: Color(0xff53452a),
      tertiary: Color(0xff4b6545),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcdebc3),
      onTertiaryContainer: Color(0xff344d2f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4d4639),
      outline: Color(0xff7f7667),
      outlineVariant: Color(0xffd1c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffebc16c),
      primaryFixed: Color(0xffffdea2),
      onPrimaryFixed: Color(0xff261900),
      primaryFixedDim: Color(0xffebc16c),
      onPrimaryFixedVariant: Color(0xff5c4200),
      secondaryFixed: Color(0xfff6e0bb),
      onSecondaryFixed: Color(0xff251a04),
      secondaryFixedDim: Color(0xffd9c4a0),
      onSecondaryFixedVariant: Color(0xff53452a),
      tertiaryFixed: Color(0xffcdebc3),
      onTertiaryFixed: Color(0xff092008),
      tertiaryFixedDim: Color(0xffb1cfa8),
      onTertiaryFixedVariant: Color(0xff344d2f),
      surfaceDim: Color(0xffe3d9cc),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffebe1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff483300),
      surfaceTint: Color(0xff79590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff89681c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff41341b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7b6b4d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff243c20),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a7453),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff151109),
      onSurfaceVariant: Color(0xff3c3529),
      outline: Color(0xff5a5144),
      outlineVariant: Color(0xff756c5d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffebc16c),
      primaryFixed: Color(0xff89681c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6e5000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7b6b4d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff625336),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a7453),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff425b3c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcfc5b8),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff1e7d9),
      surfaceContainerHigh: Color(0xffe5dbce),
      surfaceContainerHighest: Color(0xffdad0c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b2900),
      surfaceTint: Color(0xff79590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f4500),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff372a11),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff55472c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1a3217),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff364f32),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff322b1f),
      outlineVariant: Color(0xff50483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffebc16c),
      primaryFixed: Color(0xff5f4500),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff432f00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff55472c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3e3117),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff364f32),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff20381d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1b7ab),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaefe2),
      surfaceContainer: Color(0xffebe1d4),
      surfaceContainerHigh: Color(0xffddd3c6),
      surfaceContainerHighest: Color(0xffcfc5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffebc16c),
      surfaceTint: Color(0xffebc16c),
      onPrimary: Color(0xff402d00),
      primaryContainer: Color(0xff5c4200),
      onPrimaryContainer: Color(0xffffdea2),
      secondary: Color(0xffd9c4a0),
      onSecondary: Color(0xff3b2f15),
      secondaryContainer: Color(0xff53452a),
      onSecondaryContainer: Color(0xfff6e0bb),
      tertiary: Color(0xffb1cfa8),
      onTertiary: Color(0xff1e361b),
      tertiaryContainer: Color(0xff344d2f),
      onTertiaryContainer: Color(0xffcdebc3),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff17130b),
      onSurface: Color(0xffebe1d4),
      onSurfaceVariant: Color(0xffd1c5b4),
      outline: Color(0xff9a8f80),
      outlineVariant: Color(0xff4d4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff79590c),
      primaryFixed: Color(0xffffdea2),
      onPrimaryFixed: Color(0xff261900),
      primaryFixedDim: Color(0xffebc16c),
      onPrimaryFixedVariant: Color(0xff5c4200),
      secondaryFixed: Color(0xfff6e0bb),
      onSecondaryFixed: Color(0xff251a04),
      secondaryFixedDim: Color(0xffd9c4a0),
      onSecondaryFixedVariant: Color(0xff53452a),
      tertiaryFixed: Color(0xffcdebc3),
      onTertiaryFixed: Color(0xff092008),
      tertiaryFixedDim: Color(0xffb1cfa8),
      onTertiaryFixedVariant: Color(0xff344d2f),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2e2921),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd78a),
      surfaceTint: Color(0xffebc16c),
      onPrimary: Color(0xff332300),
      primaryContainer: Color(0xffb08b3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffefdab5),
      onSecondary: Color(0xff30240c),
      secondaryContainer: Color(0xffa18e6e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc7e5bd),
      onTertiary: Color(0xff132b11),
      tertiaryContainer: Color(0xff7c9875),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe7dbc9),
      outline: Color(0xffbcb0a0),
      outlineVariant: Color(0xff998f7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff5e4300),
      primaryFixed: Color(0xffffdea2),
      onPrimaryFixed: Color(0xff191000),
      primaryFixedDim: Color(0xffebc16c),
      onPrimaryFixedVariant: Color(0xff483300),
      secondaryFixed: Color(0xfff6e0bb),
      onSecondaryFixed: Color(0xff191000),
      secondaryFixedDim: Color(0xffd9c4a0),
      onSecondaryFixedVariant: Color(0xff41341b),
      tertiaryFixed: Color(0xffcdebc3),
      onTertiaryFixed: Color(0xff011502),
      tertiaryFixedDim: Color(0xffb1cfa8),
      onTertiaryFixedVariant: Color(0xff243c20),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff4a443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff221d15),
      surfaceContainer: Color(0xff2c271f),
      surfaceContainerHigh: Color(0xff373229),
      surfaceContainerHighest: Color(0xff433d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeed3),
      surfaceTint: Color(0xffebc16c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe7bd69),
      onPrimaryContainer: Color(0xff120a00),
      secondary: Color(0xffffeed3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd5c09d),
      onSecondaryContainer: Color(0xff120a00),
      tertiary: Color(0xffdaf9d0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffaecba4),
      onTertiaryContainer: Color(0xff000f01),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffbeedc),
      outlineVariant: Color(0xffcdc1b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff5e4300),
      primaryFixed: Color(0xffffdea2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffebc16c),
      onPrimaryFixedVariant: Color(0xff191000),
      secondaryFixed: Color(0xfff6e0bb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd9c4a0),
      onSecondaryFixedVariant: Color(0xff191000),
      tertiaryFixed: Color(0xffcdebc3),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb1cfa8),
      onTertiaryFixedVariant: Color(0xff011502),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff564f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff241f17),
      surfaceContainer: Color(0xff353027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4c463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
