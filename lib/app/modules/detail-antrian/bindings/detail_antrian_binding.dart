import 'package:get/get.dart';

import '../controllers/detail_antrian_controller.dart';

class DetailAntrianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAntrianController>(
      () => DetailAntrianController(),
    );
  }
}
