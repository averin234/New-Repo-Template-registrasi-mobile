import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/color/custom_color.dart';

class DialogGagalLogin extends StatelessWidget {
  const DialogGagalLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 20, left: 20, top: 200, bottom: 200),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: CustomColors.warnaputih,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.warnaputih,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/gagal.gif",
                  gaplessPlayback: true,
                  fit: BoxFit.fitHeight,
                  width: 200,
                  height: 200,
                ),
                const Text(
                    "Maaf tidak ditemukan data pasien dengan data login anda",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: CustomColors.warnabiru,
                          ),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Text("Kembali",
                                    style: TextStyle(
                                        color: CustomColors.warnaputih,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
