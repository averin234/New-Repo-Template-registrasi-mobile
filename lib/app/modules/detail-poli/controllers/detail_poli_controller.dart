import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/data/componen/publics.dart';
import 'package:rskgcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:rskgcare/app/data/model/regist_rs/antrian_dokter.dart';

class DetailPoliController extends GetxController {
  //TODO: Implement DetailPoliController

  // Items items = Get.arguments as Items;
  Jadwal jadwal = Get.arguments['jadwal'] as Jadwal;
  Items items = Get.arguments['items'] as Items;
  TextEditingController namaController = TextEditingController();
  TextEditingController jadwalController = TextEditingController();
  final noAntrianController = TextEditingController().obs;
  final dataRegist = Publics.controller.getDataRegist;
  Rx<Lists> listAntrianDokter = Lists().obs;
  RxList<Lists> listJadwalDokter = [Lists()].obs;
  Rx<DateTime> initialValue = DateTime.now().obs;

  @override
  void onInit() {
    namaController.text = dataRegist.value.namaPasien ?? '';
    noAntrianController.value.text = '';
    jadwalController.text = DateFormat('yyyy-MM-dd').format(initialValue.value);
    super.onInit();
  }
}
