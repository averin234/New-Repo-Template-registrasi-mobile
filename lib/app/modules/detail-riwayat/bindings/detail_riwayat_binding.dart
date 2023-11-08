import 'package:get/get.dart';

import '../controllers/detail_riwayat_controller.dart';

class DetailRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRiwayatController>(
      () => DetailRiwayatController(),
    );
  }
}
