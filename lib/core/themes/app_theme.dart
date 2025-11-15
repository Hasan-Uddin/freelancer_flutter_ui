import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF007354);
  static const Color accent = Color(0xFF979797);

  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: accent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF2F4F5),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3: true,
  );
}
