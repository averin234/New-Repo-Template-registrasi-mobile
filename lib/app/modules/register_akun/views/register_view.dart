import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/widgets/componen/password.dart';
import 'package:rskgcare/app/widgets/componen/register.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../../../widgets/color/custom_color.dart';
import '../../../widgets/text/string_text.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height * .1),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/registrasi.png',
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            // You can choose how the text scales
                            child: Text(
                              'Register akun Baru \n\nData diri anda terekam di database ${CustomStringText().namaRS}, Mohon periksa kembali data diri anda, dan lakukan refresh saat melakukan perubahan data diri',
                              style: TextStyle(fontSize: 12.0),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const MyRegister(),
                    const SizedBox(
                      height: 20,
                    ),
                    const MyPassWord(),
                    const SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 0,
                top: 10,
                bottom: 10,
              ),
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              ),
            ),
            Text(
              ' ${CustomStringText().Kembali}',
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff4babe7),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () async {
        if (controller.namaController.text.isNotEmpty &&
            controller.emailController.text.isNotEmpty &&
            controller.nikPasienController.text.isNotEmpty &&
            controller.jenisKelaminController.text.isNotEmpty &&
            controller.tglLhrController.text.isNotEmpty &&
            controller.noTelpController.text.isNotEmpty &&
            controller.alamatController.text.isNotEmpty &&
            controller.tempatLhrController.text.isNotEmpty &&
            controller.alergiController.text.isNotEmpty &&
            controller.golDarahController.text.isNotEmpty &&
            controller.passwordController.value.text.isNotEmpty) {
          Get.defaultDialog(
            content: const CircularProgressIndicator(),
            title: 'Loading..',
            barrierDismissible: false,
          );
          if (controller.passwordController.value.text ==
              controller.confirmPassController.value.text) {
            dynamic daftarPXBaru = await API.postDaftarPxBaru(
              namaPasien: controller.namaController.text,
              email: controller.emailController.text,
              noKtp: controller.nikPasienController.text,
              tmpLhr: controller.tempatLhrController.text,
              umurPasien:
                  controller.umur(controller.tglLhrController.text).toString(),
              jenisKelamin: controller.jenisKelaminController.text,
              tanggalLahir: controller.tglLhrController.text,
              noHp: controller.noTelpController.text,
              alamat: controller.alamatController.text,
              alergi: controller.alergiController.text,
              golonganDarah: controller.golDarahController.text,
              password: controller.passwordController.value.text,
            );
            if (daftarPXBaru['code'] != 200) {
              Get.snackbar(daftarPXBaru['code'].toString(),
                  daftarPXBaru['msg'].toString());
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          } else {
            Get.snackbar(
                'Gagal Proses', 'Password dan Confirm Password berbeda');
          }
        } else {
          Get.snackbar('title', 'message');
        }
      },
      child: Text('Register Sekarang'),
    );

    // Container(
    //   width: Get.width,
    //   padding: const EdgeInsets.symmetric(vertical: 15),
    //   alignment: Alignment.center,
    //   decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(5)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: CustomColors.warnaputih12,
    //             offset: Offset(2, 1),
    //             blurRadius: 1,
    //             spreadRadius: 2)
    //       ],
    //       gradient: LinearGradient(
    //           begin: Alignment.centerLeft,
    //           end: Alignment.centerRight,
    //           colors: [Color(0xff4babe7), Color(0xff4babe7)])),
    //   child: Text(
    //     'Register Sekarang',
    //     style: GoogleFonts.nunito(fontSize: 15, color: CustomColors.warnaputih),
    //   ),
    // ),
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.LOGIN);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah Punya Akun ?',
              style:
                  GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: GoogleFonts.nunito(
                  color: CustomColors.warnabiru,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
