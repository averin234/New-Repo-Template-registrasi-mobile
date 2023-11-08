import 'package:get/get.dart';

import '../../../data/componen/publics.dart';

class DetailRiwayatController extends GetxController {
  //TODO: Implement DetailRiwayatController

  final id = Get.arguments as String;
  final dataRegist = Publics.controller.getDataRegist;
}
