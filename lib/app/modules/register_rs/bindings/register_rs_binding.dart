import 'package:get/get.dart';

import '../controllers/register_rs_controller.dart';

class RegisterRsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRsController>(
      () => RegisterRsController(),
    );
  }
}

class ViewImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRsController>(
          () => RegisterRsController(),
    );
  }
}
