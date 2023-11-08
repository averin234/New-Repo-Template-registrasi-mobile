import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/modules/detail-poli/controllers/detail_poli_controller.dart';

import '../color/custom_color.dart';

class CardListViewPoliDetail extends StatelessWidget {
  const CardListViewPoliDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailPoliController());
    String formattedDays;
    List<String> days = controller.jadwal.rangeHari!.split(",");
    if (days.length <= 1) {
      formattedDays = days.first;
    } else {
      formattedDays =
          "${days.getRange(0, days.length - 1).join(', ')} dan ${days.last}";
    }
    return Container(
      padding: const EdgeInsets.only(
        bottom: 0,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? CustomColors.warnaputih
            : CustomColors.darkmode2,
      ),
      child: Container(
        padding: const EdgeInsets.only(right: 0, left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? CustomColors.warnaputih
                          : CustomColors.darkmode2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      controller.items.namaPegawai ?? '',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? CustomColors.warnaputih
                          : CustomColors.darkmode2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      controller.items.namaBagian ?? '',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: CustomColors.warnabiru,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              color: CustomColors.warnaputih,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? CustomColors.warnaputih
                                    : CustomColors.darkmode1,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "$formattedDays\n${DateFormat('HH:mm').format(DateTime.parse(controller.jadwal.jamMulai!))} - ${DateFormat('HH:mm').format(DateTime.parse(controller.jadwal.jamAkhir!))}",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? CustomColors.warnahitam
                                      : CustomColors.warnaputih,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          color: CustomColors.warnaputih,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: CustomColors.warnahitam,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
