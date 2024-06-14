import 'package:flutter/material.dart';

class AllGradient {
  static Gradient get errorGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE57373), Color(0xFFEF5350)],
      );
  static Gradient get successGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF81C784), Color(0xFF4CAF50)],
      );
  static Gradient get warningGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFFD54F), Color(0xFFFFB74D)],
      );
  static Gradient get infoGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF64B5F6), Color(0xFF42A5F5)],
      );
  static Gradient get primaryGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF64B5F6), Color.fromARGB(255, 93, 66, 245)],
      );
  static Gradient get secondaryGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color.fromARGB(255, 156, 100, 246), Color.fromARGB(255, 189, 0, 196)],
      );
  static Gradient get tertiaryGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color.fromARGB(255, 244, 246, 100), Color.fromARGB(255, 0, 190, 16)],
      );
}
