import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/modules/scanner_antrian/controllers/scanner_antrian_controller.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../../../widgets/color/custom_color.dart';
import '../../home/views/home_view.dart';

class ScannerAntrianView extends GetView<ScannerAntrianController> {
  const ScannerAntrianView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  HomeView()), // Ganti dengan halaman home Anda
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          actions: [
            IconButton(
              color: CustomColors.warnaputih,
              icon: ValueListenableBuilder(
                valueListenable: controller.cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => controller.cameraController.toggleTorch(),
            ),
            IconButton(
              color: CustomColors.warnahitam,
              icon: ValueListenableBuilder(
                valueListenable: controller.cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => controller.cameraController.switchCamera(),
            ),
          ],
        ),
        body: MobileScanner(
          // fit: BoxFit.contain,
          scanWindow: Rect.largest,
          controller: controller.cameraController,
          onDetect: (capture) async {
            final idReqKlinik = controller.idReqKlinik;
            final barcodes = capture.barcodes;
            // final image = capture.image;
            final noKtp = controller.dataRegist.value.noKtp ?? '';
            final kodeKlinik = barcodes.last.rawValue ?? '';

            Get.defaultDialog(
              content: const CircularProgressIndicator(),
              title: 'Loading..',
              barrierDismissible: false,
            );
            final scan = await API.scanAntrianKlinik(
                noKtp: noKtp, idReqKlinik: idReqKlinik, kodeKlinik: kodeKlinik);
            Get.back();
            if (scan.code == 200) {
              Get.toNamed(Routes.DAFTAR_ANTRIAN);
            } else {
              Get.defaultDialog(
                content: Text(
                  scan.msg.toString(),
                  style: GoogleFonts.nunito(),
                ),
                title: scan.code.toString(),
                barrierDismissible: false,
              );
            }
          },
        ),
      ),
    );
  }
}
