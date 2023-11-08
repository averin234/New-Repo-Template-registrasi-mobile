import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../../data/componen/data_regist_model.dart';
import '../../data/componen/local_storage.dart';
import '../../data/componen/publics.dart';
import '../../widgets/color/custom_color.dart';

class DialogLogout extends StatelessWidget {
  const DialogLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 90, bottom: 320),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.warnaputih,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.warnaputih,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logout_apps.png",
                  gaplessPlayback: true,
                  fit: BoxFit.fitHeight,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Apakah anda ingin Keluar?",
                    style: TextStyle(
                        color: CustomColors.warnahitam,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final getRegist = Publics.controller.getDataRegist;
                        await LocalStorages.boxDataRegist.erase();
                        await LocalStorages.boxToken.erase();
                        await LocalStorages.setDataRegist(
                          DataRegist(
                            email: getRegist.value.email,
                            password: getRegist.value.password,
                            ingatSaya: getRegist.value.ingatSaya,
                          ),
                        );
                        Publics.controller.getDataRegist.value =
                            LocalStorages.getDataRegist;
                        Publics.controller.getToken.value =
                            LocalStorages.getToken;
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.redAccent,
                        ),
                        child: Text(
                          "Ya",
                          style: TextStyle(
                            color: CustomColors.warnaputih,
                            fontSize: 17,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: CustomColors.warnabiru,
                      ),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Column(
                          children: const [
                            Text(
                              "Tidak",
                              style: TextStyle(
                                color: CustomColors.warnaputih,
                                fontSize: 17,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
