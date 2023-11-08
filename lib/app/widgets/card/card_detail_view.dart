import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/data/componen/data_regist_model.dart';
import 'package:rskgcare/app/data/componen/images.dart';
import 'package:rskgcare/app/data/model/mr_pasien/detailRiwayat.dart';

import '../color/custom_color.dart';

class CardDetailViewRiwayat extends StatelessWidget {
  final Px px;
  final DataRegist dataRegist;

  const CardDetailViewRiwayat(
      {super.key, required this.px, required this.dataRegist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 335),
                padding: const EdgeInsets.only(top: 20, left: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? CustomColors.warnaputih
                      : CustomColors.darkmode2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Tanggal Periksa",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ": ",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(
                          px.ktpPx ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff4babe7),
                          border: Border.all(
                            width: 1.5,
                            color: CustomColors.warnaputih,
                          ),
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            dataRegist.fotoPasien.toString() != 'null'
                                ? dataRegist.fotoPasien!
                                : px.gender == 'L'
                                    ? Avatar.lakiLaki
                                    : Avatar.perempuan,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "No KTP",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          px.ktpPx ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Nama",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          px.namaPx ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.warnabiru,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "No MR",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          px.nomrPx ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Umur",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          px.umur ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Golongan Darah",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          px.golDarah ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Jenis Kelamin",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          px.gender ?? '',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
