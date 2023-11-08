import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/model/regist_rs/daftar_px.dart';
import 'package:rskgcare/app/modules/detail-poli/controllers/detail_poli_controller.dart';

import '../../widgets/color/custom_color.dart';
import 'dialog_registrasi_gagal_regis.dart';
import 'dialog_registrasi_sukses.dart';

class DialogRegisPoli extends GetView<DetailPoliController> {
  const DialogRegisPoli({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10, left: 10, top: 200),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.warnaputih,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/regis_poli2.png",
                  gaplessPlayback: true,
                  fit: BoxFit.fitHeight,
                  width: 200,
                  height: 200, // default is 15 FPS
                ),
                const Text(
                    "Anda Belum Tedaftar Sebagai Pasien di RS Khusus Ginjal R.A Habibie",
                    style: TextStyle(
                        color: CustomColors.warnahitam,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    "Apakah anda ingin mendaftar sebagai \n pasien baru?",
                    style: TextStyle(
                      color: CustomColors.warnahitam,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: CustomColors.warnabiru,
                        ),
                        child: const Text(
                          "Kembali",
                          style: TextStyle(
                            color: CustomColors.warnaputih,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.greenAccent,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          final daftarPx = await API.postDaftarPx(
                            namaPasien: controller.namaController.text,
                            jadwal:
                                controller.listAntrianDokter.value.jam ?? '',
                            noAntrian:
                                (controller.listAntrianDokter.value.antrian ??
                                        0)
                                    .toString(),
                            noKtp: controller.dataRegist.value.noKtp ?? '',
                            kodeDokter: controller.items.kodeDokter ?? '',
                            kodeBagian: controller.items.kodeBagian ?? '',
                            namaBagian: controller.items.namaBagian ?? '',
                            namaKlinik: ' Rumah Sakit Budi Kemuliaan',
                            namaDokter: controller.items.namaPegawai ?? '',
                            durasi:
                                controller.listAntrianDokter.value.durasi ?? '',
                            ketKlinik: 'Baru',
                            tglDaftar: controller.jadwalController.text,
                          );
                          if (daftarPx.code.toString() == '500') {
                            Get.dialog(DialogGagalRegis(
                                daftarPx:
                                    DaftarPx.fromJson(daftarPx.toJson())));
                          } else if (daftarPx.code.toString() == '200') {
                            Get.dialog(const DialogSuksesRegis());
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                              "Lanjutkan",
                              style: TextStyle(
                                color: CustomColors.warnaputih,
                                fontSize: 15,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
