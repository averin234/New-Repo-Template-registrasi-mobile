import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/data/componen/local_storage.dart';

class DaftarAntrianController extends GetxController {
  //TODO: Implement DaftarAntrianController

  final dataPasien = LocalStorages.getDataRegist;
  final date = ''.obs;

  @override
  void onInit() {
    String hariIni = DateFormat('yyyy-MM-dd').format(DateTime.now());
    date.value = hariIni;
    super.onInit();
  }
}
