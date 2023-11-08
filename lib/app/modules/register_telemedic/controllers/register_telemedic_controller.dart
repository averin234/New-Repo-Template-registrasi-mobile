import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/data/componen/local_storage.dart';

import '../../../data/model/dropdown_model.dart';

class RegisterTelemedicController extends GetxController {
  //TODO: Implement RegisterTelemedicController
  final selectedValue = ''.obs;
  final namaDokterController = TextEditingController();
  final kodeDokterController = TextEditingController();
  final asuransiController = TextEditingController();
  final selectedPayment = 1.obs;
  final waktuKunjunganController = TextEditingController();
  final namaPasienController = TextEditingController();
  TextEditingController jadwalController = TextEditingController();
  TextEditingController jenisPasienController = TextEditingController();
  RxString jnsKunjBPJSController = '1'.obs;
  TextEditingController kolom1Controller = TextEditingController();
  TextEditingController kolom2Controller = TextEditingController();
  Rx<DateTime> initialValue = DateTime.now().obs;
  RxString antrian = ''.obs;
  final dataRegist = LocalStorages.getDataRegist;
  final waktuKunjungan = [
    Dropdowns(kategori: 'Pagi', initialValue: '1'),
    Dropdowns(kategori: 'Siang', initialValue: '2'),
    Dropdowns(kategori: 'Malam', initialValue: '3'),
  ];
  final isTapped = false.obs;
  final List<String> items = [
    'Umum',
    'BPJS',
    'Asuransi/Perusahaan',
    'Karyawan',
  ];

  void jenisPx(String itemPasien) {
    if (itemPasien == 'Umum') {
      jenisPasienController.text = '1';
    } else if (itemPasien == 'BPJS') {
      jenisPasienController.text = '2';
    } else if (itemPasien == 'Umum') {
      jenisPasienController.text = '3';
    } else {
      jenisPasienController.text = '4';
    }
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.add_chart_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
  RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    namaPasienController.text = dataRegist.namaPasien ?? '';
    selectedValue.value = items.first;
    jadwalController.text = DateFormat('yyyy-MM-dd').format(initialValue.value);
    super.onInit();
  }
}
