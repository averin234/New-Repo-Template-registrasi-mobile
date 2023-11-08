import 'package:get/get.dart';

import '../controllers/detail_poli_controller.dart';

class DetailPoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPoliController>(
      () => DetailPoliController(),
    );
  }
}
