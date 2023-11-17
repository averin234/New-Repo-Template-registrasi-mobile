import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info/package_info.dart';

import '../../../widgets/color/custom_color.dart';

class RegisterRsController extends GetxController {
  //TODO: Implement RegisterRsController
  final namaBagian = ''.obs;
  final isNoHome = (Get.arguments ?? false) as bool;

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
          const Text(
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.warnabiru),
          child: const Center(
            child: Text('Unduh Sekarang',
                style: TextStyle(
                    color: CustomColors.warnaputih,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  String rangeHari(String rangeHari) {
    String formattedDays;
    List<String> days = rangeHari.split(",");
    if (days.length <= 1) {
      formattedDays = days.first;
    } else {
      formattedDays =
          "${days.getRange(0, days.length - 1).join(', ')} dan ${days.last}";
    }
    return formattedDays;
  }
}
