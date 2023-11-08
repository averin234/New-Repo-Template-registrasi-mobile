import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/data/model/regist_rs/daftar_px.dart';

import '../../widgets/color/custom_color.dart';

class DialogGagalRegis extends StatelessWidget {
  final DaftarPx daftarPx;
  const DialogGagalRegis({super.key, required this.daftarPx});

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
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/sudah_regis.png",
                  gaplessPlayback: true,
                  fit: BoxFit.fitHeight,
                  width: 200,
                  height: 200,
                ),
                Text(daftarPx.msg.toString(),
                    style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 100, right: 100, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: CustomColors.warnabiru,
                    ),
                    child: Text(
                      "Kembali",
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
