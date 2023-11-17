import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

import '../color/custom_color.dart';
import '../text/string_text.dart';

class Penting extends StatefulWidget {
  const Penting({Key? key}) : super(key: key);

  @override
  _PentingState createState() => _PentingState();
}

class _PentingState extends State<Penting> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Penting !!',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.warnaputih,
                    fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextScroll(
              'Data diri anda terekam di database ${CustomStringText().namaRS} Mohon periksa kembali data diri anda, dan lakukan refresh saat melakukan perubahan data diri',
              textDirection: TextDirection.ltr,
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  color: CustomColors.warnaputih,
                  fontSize: 11),
              intervalSpaces: 10,
              velocity: const Velocity(
                pixelsPerSecond: Offset(8, 0),
              ),
            ),
          ],
        ));
  }
}
