import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rskgcare/app/modules/register_telemedic/controllers/register_telemedic_controller.dart';
import 'package:rskgcare/app/modules/register_telemedic/views/widgets/card_form_telel_asuransi.dart';
import 'package:rskgcare/app/modules/register_telemedic/views/widgets/card_form_telel_bpjs.dart';

import '../../../../widgets/color/custom_color.dart';
import 'card_form_info_tele.dart';
import 'card_form_telel2.dart';
import 'mydropdown.dart';

class CardFromTele extends GetView<RegisterTelemedicController> {
  const CardFromTele({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CardFromInfoTele(),
            _emailPasswordWidget(),
            const SizedBox(height: 20),
            const CardFromtele2(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title,
      {required TextEditingController controller, bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            readOnly: isPassword,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _entryFieldNIK(String title, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            obscureText: isPassword,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.person, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xffECFAF5),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _entryFieldPhone(String title, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            obscureText: isPassword,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      alignment: Alignment.center,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: CustomColors.warnaputih,
                offset: Offset(2, 1),
                blurRadius: 1,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff308366), Color(0xff308366)])),
      child: const Text(
        'Kirim',
        style: TextStyle(
            fontSize: 20,
            color: CustomColors.warnaputih,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget _poto() {
  //   return ClipRRect(
  //     child: CardListViewPoliDetail(),
  //   );
  // }

  Widget _emailPasswordWidget() {
    final controller = Get.put(RegisterTelemedicController());
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Registrasi Hemodialisis',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            // _entryField("Nama Pasien :",
            //     isPassword: true, controller: controller.namaPasienController),
            // _entryRadio("Tentukan Jadwal"),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Pasien Lama/Baru",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const CustomRadio(),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pilih Jenis Pasien",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  WidgetTitle3(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => controller.selectedValue.value == 'BPJS'
                ? const CardFromPBJS()
                : controller.selectedValue.value == 'Asuransi/Perusahaan'
                    ? const CardFromAsuransi()
                    : Container()),
          ],
        ));
  }
}

class CustomRadio extends GetView<RegisterTelemedicController> {
  const CustomRadio({super.key});

  Widget customCardButton(String assetName, int index) {
    return OutlinedButton(
      onPressed: () => controller.selectedPayment.value = index,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (controller.selectedPayment.value == index) ? 2.0 : 0.5,
            color: (controller.selectedPayment.value == index)
                ? const Color(0xff4babe7)
                : const Color(0xff4babe7)),
      ),
      child: Stack(
        children: [
          const Center(
              child: Text(
            "Pasien Baru",
            style: TextStyle(color: Color(0xff4babe7)),
          )),
          if (controller.selectedPayment.value == index)
            const Positioned(top: 5, right: 5, child: Text("")),
        ],
      ),
    );
  }

  Widget customCardButton2(String assetName, int index) {
    return OutlinedButton(
      onPressed: () => controller.selectedPayment.value = index,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (controller.selectedPayment.value == index) ? 2.0 : 0.5,
            color: (controller.selectedPayment.value == index)
                ? Color(0xff4babe7)
                : Color(0xff4babe7)),
      ),
      child: Stack(
        children: [
          const Center(
              child: Text(
            "Pasien Lama",
            style: TextStyle(color: Color(0xff4babe7)),
          )),
          if (controller.selectedPayment.value == index)
            const Positioned(top: 5, right: 5, child: Text("")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: customCardButton("assets/images/visa.png", 1),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: customCardButton2("assets/images/mastercard.png", 2),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
