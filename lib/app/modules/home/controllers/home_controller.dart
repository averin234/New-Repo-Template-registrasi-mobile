import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info/package_info.dart';
import 'package:rskgcare/app/data/componen/publics.dart';

import '../../../widgets/color/custom_color.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final dataRegist = Publics.controller.getDataRegist;
  final bagianValue = '';

  final InAppUpdate inAppUpdate = InAppUpdate();

  get updateAvailable => null;

  Future<void> checkForUpdate() async {
    final packageInfo = (GetPlatform.isAndroid)
        ? await PackageInfo.fromPlatform()
        : PackageInfo(
            appName: '',
            packageName: '',
            version: '',
            buildNumber: '',
          );
    final currentVersion = packageInfo.version;

    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.flexibleUpdateAllowed) {
        final latestVersion = updateInfo.availableVersionCode.toString();
        if (currentVersion != latestVersion) {
          showUpdateDialog();
        }
      }
    } catch (e) {
      print('Error checking for updates: $e');
    }
  }

  void showUpdateDialog() {
    Get.defaultDialog(
      title: 'Pembaruan Tersedia',
      content: Column(
        children: [
          Image.asset(
            "assets/updateaplikasi.png",
            gaplessPlayback: true,
            fit: BoxFit.fitHeight,
            height: 200,
          ),
          Text(
              'Versi baru aplikasi tersedia. Apakah Anda ingin mengunduh pembaruan sekarang?',
              textAlign: TextAlign.center),
        ],
      ),
      confirm: InkWell(
        onTap: () async {
          await InAppUpdate.performImmediateUpdate();
          Get.back();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.warnabiru),
          child: Center(
            child: Text('Unduh Sekarang',
                style: TextStyle(
                    color: CustomColors.warnaputih,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
