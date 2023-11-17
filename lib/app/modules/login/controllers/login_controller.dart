import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sirs_averin/app/data/componen/publics.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final dataRegist = Publics.controller.getDataRegist;
  final isObscurePass = true.obs;
  final isObscureConfirmPass = true.obs;
  final ingatSaya = false.obs;
  final lupapassword = TextEditingController();

  @override
  void onInit() {
    ingatSaya.value = dataRegist.value.ingatSaya ?? false;
    if (ingatSaya.value == true) {
      usernameController.text = dataRegist.value.email ?? '';
      passwordController.text = dataRegist.value.password ?? '';
    }
    super.onInit();
  }
}
