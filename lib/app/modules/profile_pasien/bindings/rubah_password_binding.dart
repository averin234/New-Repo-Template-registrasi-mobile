import 'package:get/get.dart';

import '../controllers/rubah_password_controller.dart';

class RubahPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahPasswordController>(
      () => RubahPasswordController(),
    );
  }
}
