import 'package:get/get.dart';

import '../controllers/daftar_antrian_controller.dart';

class DaftarAntrianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarAntrianController>(
      () => DaftarAntrianController(),
    );
  }
}
