import 'package:get/get.dart';

import '../controllers/no_home_controller.dart';

class NoHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoHomeController>(
      () => NoHomeController(),
    );
  }
}
