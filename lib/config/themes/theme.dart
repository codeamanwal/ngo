import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return MaterialScheme(
      brightness: Brightness.light,
      primary: Colors.blueAccent,
      surfaceTint: Colors.blueAccent,
      onPrimary: Color(4294967295),
      primaryContainer: Colors.blueAccent,
      onPrimaryContainer: Color(4294967295),
      secondary: Colors.red,
      onSecondary: Color(4294967295),
      secondaryContainer: Colors.redAccent.shade100,
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4286121118),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288822982),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294637823),
      onBackground: Color(4279835428),
      surface: Color(4294637823),
      onSurface: Color(4279835428),
      surfaceVariant: Color(4292797172),
      onSurfaceVariant: Color(4282533461),
      outline: Color(4285691783),
      outlineVariant: Color(4290954968),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217081),
      inverseOnSurface: Color(4293914876),
      inversePrimary: Color(4289906175),
      primaryFixed: Color(4292535039),
      onPrimaryFixed: Color(4278196296),
      primaryFixedDim: Color(4289906175),
      onPrimaryFixedVariant: Color(4278206625),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4282319616),
      secondaryFixedDim: Color(4294948006),
      onSecondaryFixedVariant: Color(4287630848),
      tertiaryFixed: Color(4294629375),
      onTertiaryFixed: Color(4281532485),
      tertiaryFixedDim: Color(4293832959),
      onTertiaryFixedVariant: Color(4285923483),
      surfaceDim: Color(4292401637),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112255),
      surfaceContainer: Color(4293717497),
      surfaceContainerHigh: Color(4293388275),
      surfaceContainerHighest: Color(4292993774),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278205593),
      surfaceTint: Color(4278212306),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278215665),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4287106304),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293205248),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285530259),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288822982),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294637823),
      onBackground: Color(4279835428),
      surface: Color(4294637823),
      onSurface: Color(4279835428),
      surfaceVariant: Color(4292797172),
      onSurfaceVariant: Color(4282270289),
      outline: Color(4284112750),
      outlineVariant: Color(4285954698),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217081),
      inverseOnSurface: Color(4293914876),
      inversePrimary: Color(4289906175),
      primaryFixed: Color(4279921657),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278211533),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4293205248),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4290188544),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289415119),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287572403),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401637),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112255),
      surfaceContainer: Color(4293717497),
      surfaceContainerHigh: Color(4293388275),
      surfaceContainerHighest: Color(4292993774),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278197846),
      surfaceTint: Color(4278212306),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278205593),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283171840),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287106304),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282187858),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285530259),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294637823),
      onBackground: Color(4279835428),
      surface: Color(4294637823),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292797172),
      onSurfaceVariant: Color(4280230961),
      outline: Color(4282270289),
      outlineVariant: Color(4282270289),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217081),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293389311),
      primaryFixed: Color(4278205593),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278200427),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287106304),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284417536),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285530259),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283236455),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401637),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112255),
      surfaceContainer: Color(4293717497),
      surfaceContainerHigh: Color(4293388275),
      surfaceContainerHighest: Color(4292993774),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289906175),
      surfaceTint: Color(4289906175),
      onPrimary: Color(4278201203),
      primaryContainer: Color(4278213341),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294948006),
      onSecondary: Color(4284876544),
      secondaryContainer: Color(4293205248),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4293832959),
      onTertiary: Color(4283629679),
      tertiaryContainer: Color(4288165053),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279309083),
      onBackground: Color(4292993774),
      surface: Color(4279309083),
      onSurface: Color(4292993774),
      surfaceVariant: Color(4282533461),
      onSurfaceVariant: Color(4290954968),
      outline: Color(4287402145),
      outlineVariant: Color(4282533461),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292993774),
      inverseOnSurface: Color(4281217081),
      inversePrimary: Color(4278212306),
      primaryFixed: Color(4292535039),
      onPrimaryFixed: Color(4278196296),
      primaryFixedDim: Color(4289906175),
      onPrimaryFixedVariant: Color(4278206625),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4282319616),
      secondaryFixedDim: Color(4294948006),
      onSecondaryFixedVariant: Color(4287630848),
      tertiaryFixed: Color(4294629375),
      onTertiaryFixed: Color(4281532485),
      tertiaryFixedDim: Color(4293832959),
      onTertiaryFixedVariant: Color(4285923483),
      surfaceDim: Color(4279309083),
      surfaceBright: Color(4281743682),
      surfaceContainerLowest: Color(4278914582),
      surfaceContainerLow: Color(4279835428),
      surfaceContainer: Color(4280098600),
      surfaceContainerHigh: Color(4280756786),
      surfaceContainerHighest: Color(4281480253),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290300415),
      surfaceTint: Color(4289906175),
      onPrimary: Color(4278195005),
      primaryContainer: Color(4284255487),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294949549),
      onSecondary: Color(4281664000),
      secondaryContainer: Color(4294923578),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293965823),
      onTertiary: Color(4281008186),
      tertiaryContainer: Color(4291454446),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279309083),
      onBackground: Color(4292993774),
      surface: Color(4279309083),
      onSurface: Color(4294769407),
      surfaceVariant: Color(4282533461),
      onSurfaceVariant: Color(4291218140),
      outline: Color(4288586419),
      outlineVariant: Color(4286546835),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292993774),
      inverseOnSurface: Color(4280756786),
      inversePrimary: Color(4278206884),
      primaryFixed: Color(4292535039),
      onPrimaryFixed: Color(4278193970),
      primaryFixedDim: Color(4289906175),
      onPrimaryFixedVariant: Color(4278202751),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281073920),
      secondaryFixedDim: Color(4294948006),
      onSecondaryFixedVariant: Color(4285597952),
      tertiaryFixed: Color(4294629375),
      onTertiaryFixed: Color(4280483888),
      tertiaryFixedDim: Color(4293832959),
      onTertiaryFixedVariant: Color(4284219514),
      surfaceDim: Color(4279309083),
      surfaceBright: Color(4281743682),
      surfaceContainerLowest: Color(4278914582),
      surfaceContainerLow: Color(4279835428),
      surfaceContainer: Color(4280098600),
      surfaceContainerHigh: Color(4280756786),
      surfaceContainerHighest: Color(4281480253),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294769407),
      surfaceTint: Color(4289906175),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290300415),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294949549),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293965823),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279309083),
      onBackground: Color(4292993774),
      surface: Color(4279309083),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282533461),
      onSurfaceVariant: Color(4294769407),
      outline: Color(4291218140),
      outlineVariant: Color(4291218140),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292993774),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278199654),
      primaryFixed: Color(4292929279),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290300415),
      onPrimaryFixedVariant: Color(4278195005),
      secondaryFixed: Color(4294959322),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294949549),
      onSecondaryFixedVariant: Color(4281664000),
      tertiaryFixed: Color(4294696447),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293965823),
      onTertiaryFixedVariant: Color(4281008186),
      surfaceDim: Color(4279309083),
      surfaceBright: Color(4281743682),
      surfaceContainerLowest: Color(4278914582),
      surfaceContainerLow: Color(4279835428),
      surfaceContainer: Color(4280098600),
      surfaceContainerHigh: Color(4280756786),
      surfaceContainerHighest: Color(4281480253),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
