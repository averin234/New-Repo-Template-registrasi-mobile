import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/color/custom_color.dart';
import '../constants.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTapSuffix;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.onTapSuffix,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kPaddingM),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? CustomColors.warnahitam.withOpacity(0.12)
                : CustomColors.warnaputih,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? CustomColors.warnahitam.withOpacity(0.12)
                : CustomColors.warnaputih,
          ),
        ),
        fillColor: Theme.of(context).brightness == Brightness.light
            ? CustomColors.warnaputih
            : CustomColors.darkmode2,
        hintText: label,
        hintStyle: GoogleFonts.nunito(
          color: kBlack.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onTapSuffix,
                child: Icon(
                  suffixIcon,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey
                      : Colors.grey,
                ),
              )
            : null,
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey
              : Colors.grey,
        ),
      ),
      obscureText: obscureText,
    );
  }
}
