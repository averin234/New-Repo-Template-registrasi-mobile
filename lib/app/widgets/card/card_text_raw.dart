import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_pages.dart';
import '../color/custom_color.dart';
import '../font_size/my_font_size.dart';
import '../font_size/my_style.dart';

class WidgetTitle2 extends StatelessWidget {
  const WidgetTitle2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 10, 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
              child: Text("Jadwal Dokter", style: MyStyle.textTitleBlack),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.REGISTER_RS, arguments: true);
              },
              child: Text(
                "Lihat Semua",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  color: CustomColors.warnabiru,
                  fontSize: MyFontSize.medium1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Text("Buat Janji dengan dokter sesuai kebutuhanmu."),
      ]),
    );
  }
}
