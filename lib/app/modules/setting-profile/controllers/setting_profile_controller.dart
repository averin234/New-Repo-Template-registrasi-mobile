import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:rskgcare/app/data/componen/publics.dart';
import 'package:get/get.dart';

class SettingProfileController extends GetxController {
  //TODO: Implement SettingProfileController
  //TODO: Implement HomeController
  final dataRegist = Publics.controller.getDataRegist;
  final bagianValue = '';
  final pwlama = TextEditingController();
  final pwbaru = TextEditingController();
  final pwbaruconfirm = TextEditingController();

  final _packageName = ''.obs;
  String get packageName => _packageName.value;

  late final DeviceInfoPlugin deviceInfo;

  @override
  void onInit() async {
    super.onInit();

    deviceInfo = DeviceInfoPlugin();
    final androidInfo = (GetPlatform.isAndroid)
        ? await deviceInfo.androidInfo
        : AndroidDeviceInfo;
    final packageInfo = (GetPlatform.isAndroid)
        ? await PackageInfo.fromPlatform()
        : PackageInfo(
            appName: '',
            packageName: '',
            version: '',
            buildNumber: '',
          );
    _packageName.value = packageInfo.version;
  }
}
