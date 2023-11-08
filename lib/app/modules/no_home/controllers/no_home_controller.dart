import 'package:get/get.dart';
import 'package:rskgcare/app/data/componen/publics.dart';

class NoHomeController extends GetxController {
  //TODO: Implement NoHomeController
  final dataRegist = Publics.controller.getDataRegist;
  final bagianValue = '';
  final namaBagian = ''.obs;
  final isNoHome = (Get.arguments ?? false) as bool;
}
