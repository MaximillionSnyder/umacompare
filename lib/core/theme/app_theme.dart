import 'package:flutter/material.dart';
import 'uma_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: UmaColors.bg,
      colorScheme: const ColorScheme.dark(
        primary: UmaColors.accent,
        secondary: UmaColors.accentCyan,
        surface: UmaColors.surface,
        error: UmaColors.stamina,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: UmaColors.bg,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: UmaColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        iconTheme: IconThemeData(color: UmaColors.textPrimary),
      ),
      cardTheme: CardTheme(
        color: UmaColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: UmaColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          color: UmaColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: UmaColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: UmaColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: UmaColors.textSecondary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: UmaColors.textSecondary,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: UmaColors.textMuted,
          fontSize: 12,
        ),
        labelLarge: TextStyle(
          color: UmaColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: UmaColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: UmaColors.accent, width: 2),
        ),
        hintStyle: const TextStyle(color: UmaColors.textMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: UmaColors.accent,
          foregroundColor: UmaColors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: UmaColors.accent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: UmaColors.accent),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: UmaColors.surface,
        selectedItemColor: UmaColors.accent,
        unselectedItemColor: UmaColors.textMuted,
      ),
    );
  }
}
