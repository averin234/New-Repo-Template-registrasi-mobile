import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/modules/register_telemedic/views/widgets/card_form_tele.dart';
import 'package:rskgcare/app/modules/register_telemedic/views/widgets/widget_slider_hemo.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/font_size/my_font_size.dart';
import '../controllers/register_telemedic_controller.dart';

class RegisterTelemedicView extends GetView<RegisterTelemedicController> {
  const RegisterTelemedicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_rounded),
                color: CustomColors.warnabiru,
                iconSize: 40,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              "Hemodialisis",
              style: GoogleFonts.nunito(
                  fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
            ),
            actions: const [],
            bottom: AppBar(
              toolbarHeight: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  CardFromTele(),
                ],
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: CustomColors.warnaputih,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        height: 75,
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Regis Hemodialisis utk Lanjutkan",
                          style: TextStyle(color: CustomColors.warnahitam))),
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff4babe7),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () async {
                  print(
                      'nama Pasien: ${controller.dataRegist.namaPasien ?? ''}');
                  print('no KTP: ${controller.dataRegist.noKtp ?? ''}');
                  print(
                      'jenis Pasien: ${controller.jenisPasienController.text}');
                  print(
                      'waktu Kunjungan: ${controller.waktuKunjunganController.text}');
                  print('kode Dokter: ${controller.kodeDokterController.text}');
                  print('Nama Dokter: ${controller.namaDokterController.text}');
                  print('jadwal: ${controller.jadwalController.text}');
                  print(
                      'Pasien lama/baru: ${controller.selectedPayment.value.toString()}');
                  print('asuransi: ${controller.asuransiController.text}');
                  print('kolom 1: ${controller.kolom1Controller.text}');
                  print('kolom 2: ${controller.kolom2Controller.text}');
                  print(
                      'jns kunjungan BPJS: ${controller.jnsKunjBPJSController.value}');
                  final daftarHemo = await API.postDaftarHemo(
                    namaPasien: controller.dataRegist.namaPasien ?? '',
                    noKtp: controller.dataRegist.noKtp ?? '',
                    flagPesan: controller.waktuKunjunganController.text,
                    kodeDokter: controller.kodeDokterController.text,
                    namaDokter: controller.namaDokterController.text,
                    tglDaftar: controller.jadwalController.text,
                    jenisPx: controller.jenisPasienController.text,
                    pxLama: controller.selectedPayment.value.toString(),
                    kdAsuransi: controller.asuransiController.text,
                    kolom1: controller.kolom1Controller.text,
                    kolom2: controller.kolom2Controller.text,
                    jnsKunjBpjs: controller.jnsKunjBPJSController.value,
                  );
                  Get.snackbar((daftarHemo.code ?? 500).toString(),
                      daftarHemo.msg ?? '');
                },
                child: Text('Lanjutkan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
