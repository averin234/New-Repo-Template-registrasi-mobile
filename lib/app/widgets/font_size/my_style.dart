import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/custom_color.dart';
import 'my_font_size.dart';

class MyStyle {
  static TextStyle textTitleBlack = GoogleFonts.nunito(
      fontSize: MyFontSize.large2,
      fontWeight: FontWeight.bold);

  static TextStyle textParagraphBlack = GoogleFonts.nunito(
    color: CustomColors.blackText,
    fontSize: MyFontSize.medium2,
  );
}
