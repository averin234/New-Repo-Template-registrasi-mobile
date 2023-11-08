import 'package:get/get.dart';

import '../controllers/scanner_antrian_controller.dart';

class ScannerAntrianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerAntrianController>(
      () => ScannerAntrianController(),
    );
  }
}
