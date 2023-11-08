import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/modules/detail-antrian/controllers/detail_antrian_controller.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../color/custom_color.dart';
import 'garis.dart';

class CardTicketAntrian extends StatelessWidget {
  const CardTicketAntrian({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailAntrianController());
    return Container(
      height: 1000,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? CustomColors.warnaputih
                    : CustomColors.darkmode2,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // 'rumah sakit pluit',
                    controller.data.namaKlinik ?? '',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.warnabiru,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.data.namaBagian ?? '',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const garisbiru(),
                  const SizedBox(height: 30),
                  Text(
                    "Nomor Antrean",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    controller.data.noAntrian ?? '',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.warnabiru,
                        fontSize: 45),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Jam Antrean",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${controller.data.jamAwal ?? ''} - ${controller.data.jamAkhir}",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.warnabiru,
                        fontSize: 15),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tanggal : ",
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                (controller.data.tgl ?? '').substring(0, 10),
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dokter : ",
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                child: Text(
                                  controller.data.namaDokter ?? '',
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Pasien Umum",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.warnabiru,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 0, right: 20),
                          child: Column(children: [
                            Text(
                              controller.scan.msg ?? '',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.normal, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            controller.scan.code == 200
                ? InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SCANNER_ANTRIAN,
                          arguments: controller.data.idReg ?? '');
                    },
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.greenAccent,
                                Colors.greenAccent
                              ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code_scanner_rounded,
                            color: CustomColors.warnaputih,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Scan',
                            style: GoogleFonts.nunito(
                                fontSize: 20,
                                color: CustomColors.warnaputih,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
