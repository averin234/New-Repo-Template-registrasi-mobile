import 'package:get/get.dart';

import '../controllers/riwayat_medis_controller.dart';

class RiwayatMedisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatMedisController>(
      () => RiwayatMedisController(),
    );
  }
}
