import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rskgcare/app/data/componen/publics.dart';

class ScannerAntrianController extends GetxController {
  //TODO: Implement ScannerAntrianController
  MobileScannerController cameraController = MobileScannerController();
  final dataRegist = Publics.controller.getDataRegist;
  final idReqKlinik = Get.arguments ?? '';
}
