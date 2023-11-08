import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/custom_color.dart';

class MyEntryField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final int? maxLength;
  final bool? readonly;
  const MyEntryField(this.title,
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.maxLength,
      this.readonly,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? CustomColors.warnaputih
                      : CustomColors.darkmode1,
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              maxLength: maxLength,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              textInputAction: TextInputAction.next,
              readOnly: readonly ?? false,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xffeaeaea),
                    ),
                    borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  suffixIcon: suffixIcon,
                  fillColor: Theme.of(context).brightness == Brightness.light
                      ? CustomColors.warnaputih
                      : CustomColors.darkmode1,
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }
}
