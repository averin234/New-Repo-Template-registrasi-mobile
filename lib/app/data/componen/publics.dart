import 'package:get/get.dart';
import 'package:rskgcare/app/data/componen/local_storage.dart';

class UniverseController extends GetxController {
  final getDataRegist = LocalStorages.getDataRegist.obs;
  final getToken = LocalStorages.getToken.obs;
}

class Publics {
  static var controller = Get.put(UniverseController());
}
