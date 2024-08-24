import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0F3759);
const Color secondaryColor = Color(0xFF00A59B);

const Color backgroundColor = Color(0xFFF7FBFF);
const Color cardImgBackgroundColor = Color(0xFFEEEEF0);

const Color highlightColor = Color(0xFF9093AC);

const Color primaryTextColor = Color(0xFF0F3759);
const Color secondaryTextColor = Color(0xFF9093AC);

const Color largeAppBarColor = Color(0xFF0D91DA);
const Color brandBackgroundColor = Color(0xFFFFA629);

const Color infoColor = Color(0xFF39D7ED);
const Color dangerColor = Color(0xFFFF5A5A);
const Color successColor = Color(0xFF39ED76);
const Color warningColor = Color(0xFFFFC618);

const Color scaffoldColor = Color(0xFFFFFFFF);

class GradientColors {
  static const LinearGradient pinkGradient = LinearGradient(
    colors: [
      Color(0xFFFF9598),
      Color(0xFFFF70A7),
    ],
    stops: [0.25, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF19E5A5),
      Color(0xFF15BD92),
    ],
    stops: [0.25, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [
      Color(0xFFFFC06F),
      Color(0xFFFF793A),
    ],
    stops: [0.25, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient lightBlueGradient = LinearGradient(
    colors: [
      Color(0xFF4DB7FF),
      Color(0xFF3E7DFF),
    ],
    stops: [0.25, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient darkBlueGradient = LinearGradient(
    colors: [
      Color(0xFF828282),
      Color(0xFF090F47),
    ],
    stops: [0.25, 0.75],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
