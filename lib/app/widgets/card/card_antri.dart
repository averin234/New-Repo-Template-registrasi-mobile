import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../routes/app_pages.dart';
import '../color/custom_color.dart';

class WidgetCard extends StatelessWidget {
  final Map<String, dynamic> lists;
  const WidgetCard({Key? key, required this.lists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.DETAIL_ANTRIAN, arguments: lists);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/antriansekarang.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Nomor Antrean',
                            style: GoogleFonts.nunito(
                              color: CustomColors.warnabiru,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            lists['data'].noAntrian ?? '-',
                            style: GoogleFonts.nunito(
                              color: CustomColors.warnabiru,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
//CrossAxisAlignment.end ensures the components are aligned from the right to left.
                        children: [
                          Text(
                            lists['data'].namaKlinik ?? '',
                            style: GoogleFonts.nunito(
                              color: CustomColors.warnaputih,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: TextScroll(
                              lists['data'].namaDokter ?? '',
                              style: GoogleFonts.nunito(
                                color: CustomColors.warnaputih,
                                fontWeight: FontWeight.bold,
                              ),
                              intervalSpaces: 10,
                              velocity:
                                  const Velocity(pixelsPerSecond: Offset(0, 0)),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: TextScroll(
                              lists['data'].namaBagian ?? '',
                              style: GoogleFonts.nunito(
                                color: CustomColors.warnaputih,
                                fontWeight: FontWeight.bold,
                              ),
                              intervalSpaces: 10,
                              velocity: const Velocity(
                                  pixelsPerSecond: Offset(10, 0)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${(lists['data'].tgl ?? '').substring(0, 10)} ${lists['data'].jamAwal ?? ''}',
                            style: GoogleFonts.nunito(
                              color: CustomColors.warnaputih,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
