import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/data/model/mr_pasien/detailRiwayat.dart';

import '../color/custom_color.dart';

class CardTindakan extends StatelessWidget {
  final List<Tindakan> tindakan;

  const CardTindakan({super.key, required this.tindakan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                padding: const EdgeInsets.only(top: 20, left: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? CustomColors.warnaputih
                      : CustomColors.darkmode2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TINDAKAN",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: CustomColors.warnabiru,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tindakan.last.namaTindakan ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tindakan.last.namaTindakan ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
