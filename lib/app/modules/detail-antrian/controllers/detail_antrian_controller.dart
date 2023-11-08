import 'package:get/get.dart';
import 'package:rskgcare/app/data/model/antrian_rs/jadwal_px.dart';

import '../../../data/model/profile_pasien/data_px.dart';

class DetailAntrianController extends GetxController {
  //TODO: Implement DetailAntrianController
  final data = Get.arguments['data'] as Lists;
  final scan = Get.arguments['scan'] as DataPx;
}
