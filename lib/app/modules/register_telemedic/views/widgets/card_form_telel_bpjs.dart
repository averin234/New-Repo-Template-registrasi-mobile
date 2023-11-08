import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rskgcare/app/modules/register_telemedic/controllers/register_telemedic_controller.dart';

import '../../../../widgets/color/custom_color.dart';

class CardFromPBJS extends StatelessWidget {
  const CardFromPBJS({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _emailPasswordWidget(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
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

  Widget _entryFieldNIK(String title,
      {bool isPassword = false, required TextEditingController controller}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
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
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            obscureText: isPassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xffeaeaea),
                ),
                borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
              ),
              border: InputBorder.none,
              fillColor: Color(0xffffffff),
              filled: true,
            ),
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
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
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
              colors: [Colors.green, Colors.green])),
      child: const Text(
        'Kirim',
        style: TextStyle(fontSize: 20, color: CustomColors.warnaputih),
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
    return Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                const Text(
                  "Form BPJS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _entryFieldNIK("No Kartu BPJS :",
                    controller: controller.kolom1Controller),
              ],
            ),
            // _entryRadio("Tentukan Jadwal"),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Jenis Kunjungan :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const CustomRadio(),
            Obx(
              () => _entryFieldNIK(
                controller.jnsKunjBPJSController.value == '1'
                    ? "No Rujukan :"
                    : "No Kontrol :",
                controller: controller.kolom2Controller,
              ),
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}

class CustomRadio extends GetView<RegisterTelemedicController> {
  const CustomRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(() {
                  return OutlinedButton(
                    onPressed: () {
                      controller.jnsKunjBPJSController.value = '1';
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      side: BorderSide(
                          width: (controller.jnsKunjBPJSController.value == '1')
                              ? 2.0
                              : 0.5,
                          color: (controller.jnsKunjBPJSController.value == '1')
                              ? Color(0xff4babe7)
                              : Color(0xff4babe7)),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                            child: Text(
                          "Rujukan",
                          style: TextStyle(color: Color(0xff4babe7)),
                        )),
                        if (controller.jnsKunjBPJSController.value == '1')
                          const Positioned(top: 5, right: 5, child: Text("")),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Obx(() {
                  return OutlinedButton(
                    onPressed: () {
                      controller.jnsKunjBPJSController.value = '2';
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      side: BorderSide(
                          width: (controller.jnsKunjBPJSController.value == '2')
                              ? 2.0
                              : 0.5,
                          color: (controller.jnsKunjBPJSController.value == '2')
                              ? Color(0xff4babe7)
                              : const Color(0xff4babe7)),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                            child: Text(
                          "Kontrol",
                          style: TextStyle(color: Color(0xff4babe7)),
                        )),
                        if (controller.jnsKunjBPJSController.value == '2')
                          const Positioned(top: 5, right: 5, child: Text("")),
                      ],
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
