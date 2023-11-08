import 'package:get/get.dart';

import '../controllers/register_telemedic_controller.dart';

class RegisterTelemedicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterTelemedicController>(
      () => RegisterTelemedicController(),
    );
  }
}
