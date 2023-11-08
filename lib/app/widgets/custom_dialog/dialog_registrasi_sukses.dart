import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../../widgets/color/custom_color.dart';

class DialogSuksesRegis extends StatelessWidget {
  const DialogSuksesRegis({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, left: 10, top: 200),
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).brightness == Brightness.light
                ? CustomColors.warnaputih
                : CustomColors.darkmode2,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/regis_poli.png",
                  gaplessPlayback: true,
                  fit: BoxFit.fitHeight,
                  width: 200,
                  height: 200,
                ),
                const Text("Sukses melakukan janji Temu",
                    style: TextStyle(
                        color: CustomColors.warnabiru,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 10,
                ),
                const Text(
                    "Silahkan Datang ke RS untuk melakukan Verifikasi lewat FO atau QRCode",
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.DAFTAR_ANTRIAN);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: CustomColors.warnabiru,
                    ),
                    child: Text(
                      "Lihat Antrean",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.warnaputih,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
