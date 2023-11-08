import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../../widgets/color/custom_color.dart';

class DialogInginLogin extends StatelessWidget {
  const DialogInginLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 90, bottom: 310, left: 20, right: 20),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.warnaputih,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/login_sukses.png",
              gaplessPlayback: true,
              fit: BoxFit.fitHeight,
              width: 200,
              height: 200,
            ),
            const Text(
                "Anda Belum Terdaftar atau Login di Aplikasi SIRS Rumah Sakit Budi Kemuliaan",
                style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 5,
            ),
            const Text(
                "Silahkan daftar atau Login untuk bisa melakukan registrasi poliklinik",
                style: TextStyle(decoration: TextDecoration.none, fontSize: 12),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: CustomColors.warnabiru,
                    ),
                    child: Column(
                      children: [
                        Text("Cancel",
                            style: TextStyle(
                              color: CustomColors.warnaputih,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.LOGIN),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.greenAccent,
                    ),
                    child: Column(
                      children: [
                        Text("Login / Regist",
                            style: TextStyle(
                              color: CustomColors.warnaputih,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
