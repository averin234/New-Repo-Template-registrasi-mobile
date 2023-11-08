import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/widgets/componen/mydropdown.dart';
import 'package:rskgcare/app/modules/register_telemedic/controllers/register_telemedic_controller.dart';

import '../../../../data/model/dropdown_model.dart';
import '../../../../widgets/color/custom_color.dart';

class CardFromAsuransi extends StatelessWidget {
  const CardFromAsuransi({super.key});
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
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
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
      decoration: BoxDecoration(),
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("Asuransi/Perusahaan",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getAsuransiPx(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final asuransiPx = snapshot.data!.list!;
                      return _myDropDown(
                        "Asuransi/Perusahaan",
                        items: asuransiPx
                            .map((e) => Dropdowns(
                                kategori: e.namaPerusahaan ?? '',
                                initialValue: e.kodePerusahaan ?? ''))
                            .toList(),
                        controller: controller.asuransiController,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
          // _entryRadio("Tentukan Jadwal"),
          // _entryFieldNIK("No Polis :"),
          // const SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
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
                ? const Color(0xff308366)
                : const Color(0xff308366)),
      ),
      child: Stack(
        children: [
          const Center(
              child: Text(
            "Rujukan",
            style: TextStyle(color: Color(0xff308366)),
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
