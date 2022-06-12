import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme(
    background: Colors.white,
    onBackground: Colors.black,
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white54,
    onSurface: Colors.black,
    primary: Colors.blue,
    onPrimary: Colors.white,
    secondary: Colors.blueAccent,
    onSecondary: Colors.white,
  ),
  fontFamily: 'Poppins',
  textTheme: GoogleFonts.poppinsTextTheme(),
);
