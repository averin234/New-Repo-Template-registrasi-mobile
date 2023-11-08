import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/model/regist_hemo/dokter_hemo.dart';
import 'package:rskgcare/app/widgets/componen/mydropdown.dart';
import 'package:rskgcare/app/modules/register_telemedic/controllers/register_telemedic_controller.dart';
import '../../../../data/model/dropdown_model.dart';
import '../../../../widgets/color/custom_color.dart';
import 'myDropDown1.dart';

class CardFromtele2 extends StatelessWidget {
  const CardFromtele2({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                const SizedBox(
                  height: 5,
                ),
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
                fillColor: Color(0xffECFAF5),
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
                border: InputBorder.none,
                fillColor: Color(0xfff6f6f6),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _myDropDown(
    String title, {
    required TextEditingController controller,
    required List<Dropdowns> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          MyDropDown1(items: items, labelText: title, controller: controller),
        ],
      ),
    );
  }

  Widget _myDropDown1(
    String title, {
    required TextEditingController controller,
    required TextEditingController controller1,
    required List<Dropdowns> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          MyDropDown2(
              items: items,
              labelText: title,
              controller: controller,
              controller1: controller1),
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
            child: Text('Tentukan Jadwal,Jam dan Dokter Pemeriksa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _calender("Tentukan Jadwal :",
                  controller: controller.jadwalController),
              _myDropDown(
                "Pilih waktu Kunjungan :",
                items: controller.waktuKunjungan,
                controller: controller.waktuKunjunganController,
              ),
              FutureBuilder(
                future: API.getDokterHemo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState != ConnectionState.waiting &&
                      snapshot.data != null) {
                    final dokter = snapshot.data!.list ?? [Lists()];
                    return _myDropDown1(
                      "Dokter Penanggung Jawab :",
                      items: List.generate(
                        dokter.length,
                        (index) => Dropdowns(
                          kategori: dokter[index].namaDokter ?? '',
                          initialValue: dokter[index].kodeDokter ?? '',
                        ),
                      ),
                      controller: controller.kodeDokterController,
                      controller1: controller.namaDokterController,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Widget _calender(String title, {required TextEditingController controller}) {
  final control = Get.put(RegisterTelemedicController());
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        readOnly: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xffeaeaea),
            ),
            borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffixIcon:
              Icon(Icons.calendar_month_rounded, color: Color(0xff4babe7)),
          fillColor: Color(0xffffffff),
          filled: true,
        ),
        controller: controller,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: Get.context!,
            initialDate: control.initialValue.value,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            control.initialValue.value = pickedDate;
            controller.text =
                DateFormat('yyyy-MM-dd').format(control.initialValue.value);
            control.antrian.value = controller.text;
          }
        },
      ),
    ]),
  );
}

class CustomRadio extends StatefulWidget {
  const CustomRadio({super.key});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  int selectedPayment = 0;

  Widget CustomCardButton(String assetName, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedPayment = index;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (selectedPayment == index) ? 2.0 : 0.5,
            color: (selectedPayment == index)
                ? const Color(0xff08D2A1)
                : const Color(0xff08D2A1)),
      ),
      child: Stack(
        children: [
          const Center(
              child: Text(
            "Rujukan",
            style: TextStyle(color: Color(0xff4babe7)),
          )),
          if (selectedPayment == index)
            const Positioned(top: 5, right: 5, child: Text("")),
        ],
      ),
    );
  }

  Widget CustomCardButton2(String assetName, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedPayment = index;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (selectedPayment == index) ? 2.0 : 0.5,
            color: (selectedPayment == index)
                ? const Color(0xff308366)
                : const Color(0xff308366)),
      ),
      child: Stack(
        children: [
          const Center(
              child: Text(
            "Kontrol",
            style: TextStyle(color: Color(0xff308366)),
          )),
          if (selectedPayment == index)
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomCardButton("assets/images/visa.png", 0),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomCardButton2("assets/images/mastercard.png", 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
