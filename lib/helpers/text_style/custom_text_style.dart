import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle H1(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        fontSize: 32.0,
        fontFamily: GoogleFonts.ubuntu().fontFamily);
  }

  static TextStyle H2(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
        fontSize: 22.0,
        fontFamily: GoogleFonts.ubuntu().fontFamily);
  }

  static TextStyle B1(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        fontSize: 17.0,
        fontFamily: GoogleFonts.roboto().fontFamily);
  }

  static TextStyle B2(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        fontSize: 15.0,
        fontFamily: GoogleFonts.roboto().fontFamily);
  }

  static TextStyle B3(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        fontSize: 13.0,
        fontFamily: GoogleFonts.roboto().fontFamily);
  }
}
