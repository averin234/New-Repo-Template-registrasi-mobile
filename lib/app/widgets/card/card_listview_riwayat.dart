import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/data/model/mr_pasien/listMRPX.dart';
import '../../routes/app_pages.dart';
import '../color/custom_color.dart';

class CardListViewRiawayat extends StatelessWidget {
  final Res res;
  const CardListViewRiawayat({
    super.key,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.only(top: 10),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_RIWAYAT, arguments: res.idReg!);
                },
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 176),
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? CustomColors.warnaputih
                        : CustomColors.darkmode2,
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //       'assets/images/bg_riwayat.png'),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(label: res.tglPeriksa ?? ''),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Di periksa oleh :",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  res.namaDokter ?? '',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Bagian :",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  res.namaBagian ?? '',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 9),
                            Container(
                              height: 1.5,
                              width: 320.0,
                              color: CustomColors.warnaabu2,
                              margin: const EdgeInsets.only(bottom: 0),
                            ),
                            const SizedBox(height: 11),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(width: 90),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: CustomColors.warnabiru,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "Tanggal & jam Periksa : $label",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: CustomColors.warnaputih,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
