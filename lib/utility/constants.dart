import 'package:flutter/material.dart';

class Constants {
  static const Color primaryColor = Color.fromRGBO(120, 110, 255, 1);
  static const Color primaryColorFaded = Color.fromRGBO(120, 110, 255, 0.1);

  static const Color primaryColorAlt = Color.fromRGBO(8, 137, 252, 1);
  static const Color primaryColorAltFaded = Color.fromRGBO(8, 137, 252, 0.1);

  static const Color secondaryColor = Color.fromRGBO(13, 217, 254, 1);
  static const Color secondaryColorFaded = Color.fromRGBO(13, 217, 254, 0.6);

  static const Color secondaryColorAlt = Color.fromRGBO(255, 210, 72, 1);
  static const Color secondaryColorFadedAlt = Color.fromRGBO(255, 210, 72, 0.7);

  static const Gradient bgGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      stops: [0.15, 0.6],
      colors: [Constants.primaryColor, Constants.secondaryColor]);

  static const Color bgColor = Color.fromRGBO(243, 242, 239, 1);

  static const Color textColor = Color.fromRGBO(0, 0, 0, 1);
}
