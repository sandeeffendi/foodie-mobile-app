import 'package:assestment_restaurant_app/core/provider/themes/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemesProvider>();

    final isSelected = [
      themeProvider.themeMode == ThemeMode.system,
      themeProvider.themeMode == ThemeMode.light,
      themeProvider.themeMode == ThemeMode.dark,
    ];

    return ToggleButtons(
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(12),
      fillColor: Theme.of(context).colorScheme.primary,
      selectedColor: Theme.of(context).colorScheme.onPrimary,

      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'System',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Light',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Dark',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      onPressed: (index) {
        if (index == 0) {
          themeProvider.setThemeMode(ThemeMode.system);
        } else if (index == 1) {
          themeProvider.setThemeMode(ThemeMode.light);
        } else {
          themeProvider.setThemeMode(ThemeMode.dark);
        }
      },
    );
  }
}
