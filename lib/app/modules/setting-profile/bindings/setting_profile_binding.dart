import 'package:get/get.dart';

import '../controllers/setting_profile_controller.dart';

class SettingProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingProfileController>(
      () => SettingProfileController(),
    );
  }
}
