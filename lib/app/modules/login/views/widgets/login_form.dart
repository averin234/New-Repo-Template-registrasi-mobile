import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:rskgcare/app/data/componen/data_regist_model.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/componen/local_storage.dart';
import 'package:rskgcare/app/data/model/login_and_regist/akses_px.dart';
import 'package:rskgcare/app/modules/login/controllers/login_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/color/custom_color.dart';
import '../../../../widgets/text/string_text.dart';
import '../constants.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';
import 'fade_slide_transition.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: CustomInputField(
                controller: controller.usernameController,
                label: 'Username or Email',
                prefixIcon: Icons.person,
              ),
            ),
            SizedBox(height: space),
            Obx(() {
              return FadeSlideTransition(
                animation: animation,
                additionalOffset: space,
                child: CustomInputField(
                  controller: controller.passwordController,
                  label: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: controller.isObscurePass.value,
                  suffixIcon: controller.isObscurePass.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onTapSuffix: () => controller.isObscurePass.isFalse
                      ? controller.isObscurePass.value = true
                      : controller.isObscurePass.value = false,
                ),
              );
            }),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: ListTile(
                dense: true,
                onTap: () => showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  enableDrag: false,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => LupaPassword(context),
                ),
                title: Text(
                  "${CustomStringText().LupaPassword}",
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Obx(() {
              return FadeSlideTransition(
                animation: animation,
                additionalOffset: 2 * space,
                child: ListTile(
                  dense: true,
                  onTap: () => controller.ingatSaya.value == false
                      ? controller.ingatSaya.value = true
                      : controller.ingatSaya.value = false,
                  leading: Checkbox(
                    splashRadius: 0,
                    value: controller.ingatSaya.value,
                    onChanged: (value) => controller.ingatSaya.value = value!,
                  ),
                  title: Text(
                    "${CustomStringText().IngatSaya}",
                    style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: CustomButton(
                color: kBlue,
                textColor: CustomColors.warnaputih,
                text: '${CustomStringText().LoginSekarang}',
                onPressed: () async {
                  if (controller.passwordController.text.isNotEmpty &&
                      controller.passwordController.text.isNotEmpty) {
                    Get.defaultDialog(
                      content: const CircularProgressIndicator(),
                      title: 'Loading..',
                      barrierDismissible: false,
                    );
                    await LocalStorages.setDataRegist(
                        DataRegist(ingatSaya: controller.ingatSaya.value));
                    AksesPX aksesPX = await API.getAksesPx(
                      pass: controller.passwordController.text,
                      user: controller.usernameController.text,
                    );
                    if (aksesPX.code != 200) {
                      Get.snackbar(
                          aksesPX.code.toString(), aksesPX.msg.toString());
                    } else {
                      Get.offAllNamed(Routes.HOME);
                    }
                  } else {
                    Get.snackbar('404', 'Username dan Password harus di Isi');
                  }
                },
              ),
            ),
            SizedBox(height: 2 * space),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 4 * space,
              child: CustomButton(
                color: kBlack,
                textColor: CustomColors.warnaputih,
                text: '${CustomStringText().RegistrasiAkun}',
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
              ),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Text(
                      "${CustomStringText().UpdateAplikasi}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Untuk Mendapatankan Perbaikan dan Kenyamanan dalam Pengoprasian Aplikasi ${CustomStringText().namaRS}",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/updateaplikasi.png",
                    gaplessPlayback: true,
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 70, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("${CustomStringText().Kembali}",
                                      style: TextStyle(
                                          color: CustomColors.warnahitam,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => LaunchReview.launch(
                            androidAppId: "averin.sirs_rskg.com",

                            // iOSAppId: "585027354",
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.greenAccent,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Update Aplikasi",
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
            )),
          ],
        ));
  }
}

Widget LupaPassword(context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final controller = Get.put(LoginController());
  return Padding(
    padding: mediaQueryData.viewInsets,
    child: Container(
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text('${CustomStringText().LupaPassword}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: CustomColors.warnahitam)),
          const SizedBox(
            height: 20,
          ),
           Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Text(
                '${CustomStringText().ulangsandi}'),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("${CustomStringText().MasukanEmail}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: CustomColors.warnaputih,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0x6cc7d1db)),
                  ),
                  child: TextFormField(
                    controller: controller.lupapassword,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 13, right: 15),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async {
              if (controller.lupapassword.text.isNotEmpty) {
                Get.defaultDialog(
                  backgroundColor: const Color(0x00e0e0e0),
                  content: CircularProgressIndicator(),
                  title: '',
                  barrierDismissible: false,
                );
                final postLupaPassword = await API.CekLupaPassword(email: '');
                Get.back();
                if (postLupaPassword.code == 200) {
                  Get.snackbar('200',
                      '${CustomStringText().kirimemail}');
                  Get.back();
                } else {
                  Get.defaultDialog(
                    title: (postLupaPassword.code ?? 0).toString(),
                    content: Text(postLupaPassword.msg ?? ''),
                  );
                }
              } else {
                Get.snackbar('500',
                    'Email yg di masukan harus sesuai dengan akun yang sudah terdaftar di Aplikasi ${CustomStringText().namaRS}');
              }
            },
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${CustomStringText().Submit}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.warnaputih)),
                    ],
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
