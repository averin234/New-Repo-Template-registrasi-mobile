import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/data/model/antrian_rs/jadwal_px.dart';
import 'package:rskgcare/app/data/model/profile_pasien/data_px.dart';
import '../../routes/app_pages.dart';
import '../color/custom_color.dart';
import '../font_size/my_font_size.dart';

class CardListViewAntrian extends StatelessWidget {
  final Lists list;
  final DataPx scan;

  const CardListViewAntrian(
      {super.key, required this.list, required this.scan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.DETAIL_ANTRIAN,
                  arguments: {'data': list, 'scan': scan});
            },
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              decoration: BoxDecoration(
                color: CustomColors.warnaputih,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.warnaabu.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(2, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.local_hospital,
                          color: CustomColors.warnaabu3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          list.namaBagian ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.warnaabu3,
                              fontSize: 17),
                        ),
                      ]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    list.namaKlinik ?? '',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.warnabiru,
                        fontSize: MyFontSize.large2),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 1.5,
                    width: 320.0,
                    color: CustomColors.warnaabu,
                    margin: const EdgeInsets.only(bottom: 0),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: CustomColors.warnaabu3,
                      ),
                      const Text("Jadwal Antrian :"),
                      Text(
                        (list.tgl ?? '').substring(0, 10),
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.warnabiru,
                            fontSize: 15),
                      ),
                      CustomButton(label: 'Lihat Detail', onPressed: () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: CustomColors.warnabiru,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              color: CustomColors.warnaputih,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
