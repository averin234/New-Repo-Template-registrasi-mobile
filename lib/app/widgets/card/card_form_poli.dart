import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/model/regist_rs/antrian_dokter.dart';
import 'package:rskgcare/app/modules/detail-poli/controllers/detail_poli_controller.dart';

import '../../data/model/regist_rs/daftar_px.dart';
import '../color/custom_color.dart';
import '../custom_dialog/dialog_registrasi_gagal_regis.dart';
import '../custom_dialog/dialog_registrasi_poli.dart';
import '../custom_dialog/dialog_registrasi_sukses.dart';
import 'card_no_antri.dart';

class CardFromPoli extends StatelessWidget {
  const CardFromPoli({super.key});

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              SizedBox(
                height: 0,
              ),
              EmailPasswordWidget(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ],
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: stack,
    );
  }
}

class EmailPasswordWidget extends GetView<DetailPoliController> {
  const EmailPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? CustomColors.warnabirumuda2
              : CustomColors.darkmode2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 40),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? CustomColors.warnaputih
                      : CustomColors.darkmode2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Buat Janji',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Buat Janji temu dengan dokter spesialis sesuai kebutuhan mu',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            _calender("Tentukan Jadwal :",
                controller: controller.jadwalController, context: context),
            Obx(() {
              return FutureBuilder(
                future: API.getAntrianDokter(
                  idJadwal: controller.jadwal.id ?? '',
                  kodeDokter: controller.items.kodeDokter ?? '',
                  tglDaftar: DateFormat('yyyy-MM-dd')
                      .format(controller.initialValue.value),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState != ConnectionState.waiting &&
                      snapshot.data != null) {
                    final data = snapshot.data!;
                    if (data.code == 500) {
                      controller.noAntrianController.value.text = '';
                      return const WidgetNoAntri();
                    } else {
                      controller.noAntrianController.value.text =
                          data.list!.first.antrian.toString();
                      controller.listAntrianDokter.value = data.list!.first;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyDropDown(
                            "Tentukan Jam :",
                            items: data.list!,
                          ),
                          const MyField(),
                          const SizedBox(
                            height: 20,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 20),
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //         padding: const EdgeInsets.all(20)),
                          //     onPressed: submitRegist,
                          //     child: Text("Register Poli",
                          //         style: GoogleFonts.nunito()),
                          //   ),
                          // )
                        ],
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            }),
          ],
        ));
  }

  void submitRegist() async {
    if (controller.noAntrianController.value.text.isNotEmpty) {
      final namaKlinik = await API.getDetailKlinik();
      final daftarAntrian = await API.getJadwalPx(
        noKtp: controller.dataRegist.value.noKtp!,
        tgl: controller.jadwalController.value.text,
      );

      if (daftarAntrian.code == 200) {
        final daftarPx = await API.postDaftarPx(
          namaPasien: controller.namaController.text,
          jadwal: controller.listAntrianDokter.value.jam ?? '',
          noAntrian: controller.noAntrianController.value.text,
          noKtp: controller.dataRegist.value.noKtp ?? '',
          kodeDokter: controller.items.kodeDokter ?? '',
          kodeBagian: controller.items.kodeBagian ?? '',
          namaBagian: controller.items.namaBagian ?? '',
          namaKlinik: namaKlinik.res!.first.namaPerusahaan ?? '',
          namaDokter: controller.items.namaPegawai ?? '',
          durasi: controller.listAntrianDokter.value.durasi ?? '',
          ketKlinik: 'Baru',
          tglDaftar: controller.jadwalController.text,
        );
        Get.dialog(
            DialogGagalRegis(daftarPx: DaftarPx.fromJson(daftarPx.toJson())));
      } else {
        final getDataPx =
            await API.getDataPx(noKtp: controller.dataRegist.value.noKtp ?? '');
        if (getDataPx.code == 200) {
          final daftarPx = await API.postDaftarPx(
            namaPasien: controller.namaController.text,
            jadwal: controller.listAntrianDokter.value.jam ?? '',
            noAntrian: controller.noAntrianController.value.text,
            noKtp: controller.dataRegist.value.noKtp ?? '',
            kodeDokter: controller.items.kodeDokter ?? '',
            kodeBagian: controller.items.kodeBagian ?? '',
            namaBagian: controller.items.namaBagian ?? '',
            namaKlinik: namaKlinik.res!.first.namaPerusahaan ?? '',
            namaDokter: controller.items.namaPegawai ?? '',
            durasi: controller.listAntrianDokter.value.durasi ?? '',
            ketKlinik: 'Baru',
            tglDaftar: controller.jadwalController.text,
          );
          Get.back();
          if (daftarPx.code == 500) {
            Get.dialog(DialogGagalRegis(
                daftarPx: DaftarPx.fromJson(daftarPx.toJson())));
          } else if (daftarPx.code == 200) {
            Get.dialog(const DialogSuksesRegis());
          }
        } else {
          Get.dialog(
            const DialogRegisPoli(),
          );
        }
      }
    } else {
      Get.dialog(
        DialogGagalRegis(
          daftarPx: DaftarPx(
            msg: 'Mohon Cari Dokter Lain atau Pilih tanggal yang berbeda',
          ),
        ),
      );
    }
  }

  Widget _calender(String title,
      {required TextEditingController controller,
      required BuildContext context}) {
    final control = Get.put(DetailPoliController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(color: CustomColors.warnaputih),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            readOnly: true,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? CustomColors.warnahitam
                  : CustomColors.warnaputih,
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.calendar_month_rounded,
                  color: CustomColors.warnabiru,
                ),
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? CustomColors.warnaputih
                    : CustomColors.darkmode1,
                filled: true),
            controller: controller,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: Get.context!,
                initialDate: control.initialValue.value,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                control.initialValue.value = pickedDate;
                controller.text =
                    DateFormat('yyyy-MM-dd').format(control.initialValue.value);
                control.noAntrianController.value.text = controller.text;
              }
            },
          ),
        ),
      ]),
    );
  }
}

class MyField extends GetView<DetailPoliController> {
  const MyField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 95),
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nomor Antrean',
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            controller: controller.noAntrianController.value,
            textAlign: TextAlign.center,
            readOnly: true,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true),
          )
        ],
      ),
    );
  }
}

class MyDropDown extends GetView<DetailPoliController> {
  final String title;
  final List<Lists> items;
  const MyDropDown(
    this.title, {
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? CustomColors.warnaputih
                  : CustomColors.darkmode1,
              border: Border.fromBorderSide(
                BorderSide(color: CustomColors.warnaputih),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: DropdownSearch<Lists>(
              popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
              ),
              items: items,
              itemAsString: (item) {
                return item.jam!;
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: CustomColors.warnahitam,
                  floatingLabelStyle: GoogleFonts.nunito(
                      textStyle: TextStyle(color: CustomColors.warnahitam)),
                  labelStyle: GoogleFonts.nunito(
                      textStyle: TextStyle(color: CustomColors.warnahitam)),
                  counterStyle: GoogleFonts.nunito(
                      textStyle: TextStyle(color: CustomColors.warnahitam)),
                  hintStyle: TextStyle(color: CustomColors.warnahitam),
                ),
              ),
              onChanged: (value) {
                controller.listAntrianDokter.value = value!;
                controller.noAntrianController.value.text =
                    value.antrian.toString();
              },
              selectedItem: items.first,
            ),
          ),
        ],
      ),
    );
  }
}
