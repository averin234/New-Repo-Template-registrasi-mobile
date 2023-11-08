import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/data/componen/publics.dart';

class RiwayatMedisController extends GetxController {
  //TODO: Implement RiwayatMedisController

  final dataRegist = Publics.controller.getDataRegist;
  final date = ''.obs;
  @override
  void onInit() {
    date.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.onInit();
  }
}
