import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/model/homepage/poli.dart';
import 'package:rskgcare/app/modules/register_rs/controllers/register_rs_controller.dart';
import 'package:rskgcare/app/widgets/card/card_listview_poli.dart';
import 'package:search_page/search_page.dart';

import '../../../../data/model/regist_rs/all_dokter_klinik.dart';
import '../../../../widgets/color/custom_color.dart';

class CariDokter extends StatefulWidget {
  const CariDokter({
    Key? key,
  }) : super(key: key);

  @override
  _CariDokterState createState() => _CariDokterState();
}

class _CariDokterState extends State<CariDokter> {
  final TextEditingController _cityTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: API.getPoli(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null) {
                  final data = snapshot.data!;
                  return AppTextField(
                    textEditingController: _cityTextEditingController,
                    hint: "Dokter/Spesialisasi",
                    isCitySelected: true,
                    lists: data.list!,
                    title: '',
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap(context) {
    final controller = Get.put(RegisterRsController());
    FutureBuilder(
        future: API.getAllDokterKlinik(filter: ''),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting &&
              snapshot.data != null) {
            final data = snapshot.data!.items!;
            return IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Items>(
                  items: data,
                  searchLabel: 'Cari Nama Dokter/Spesialisasi/Hari Periksa',
                  searchStyle:
                      GoogleFonts.nunito(color: CustomColors.warnahitam),
                  showItemsOnEmpty: true,
                  failure: Center(
                    child: Text(
                      'Dokter Tidak Terdaftar :(',
                      style: GoogleFonts.nunito(),
                    ),
                  ),
                  filter: (dokter) => [
                    // dokter.jadwal![0].id,
                    dokter.kodeDokter,
                    dokter.no.toString(),
                    dokter.namaPegawai,
                    dokter.namaBagian,
                    // dokter.jadwal![0].rangeHari,
                  ],
                  builder: (dokter) => CardListViewPoli(
                      items: dokter, isNoHome: controller.isNoHome),
                ),
              ),
              icon: const Icon(
                Icons.person_search_rounded,
                size: 30,
              ),
              color: CustomColors.warnabiru,
            );
          } else {
            return Container();
          }
        });
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterRsController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: API.getAllDokterKlinik(filter: ''),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting &&
                  snapshot.data != null) {
                final data = snapshot.data!.items!;
                return TextFormField(
                  readOnly: true,
                  controller: textEditingController,
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: SearchPage<Items>(
                        items: data,
                        searchLabel:
                            'Cari Nama Dokter/Spesialisasi/Hari Periksa',
                        searchStyle: GoogleFonts.nunito(),
                        showItemsOnEmpty: true,
                        failure: Center(
                          child: Text(
                            'Dokter Tidak Terdaftar :(',
                            style: GoogleFonts.nunito(),
                          ),
                        ),
                        filter: (dokter) => [
                          // dokter.jadwal![0].id,
                          dokter.kodeDokter,
                          dokter.no.toString(),
                          dokter.namaPegawai,
                          dokter.namaBagian,
                          // dokter.jadwal![0].rangeHari,
                        ],
                        builder: (dokter) => CardListViewPoli(
                            items: dokter, isNoHome: controller.isNoHome),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? CustomColors.warnaputih
                        : CustomColors.darkmode1,
                    suffixIcon: const Icon(Icons.search_rounded,
                        color: CustomColors.warnabiru),
                    contentPadding: const EdgeInsets.only(
                        left: 8, bottom: 0, top: 0, right: 15),
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? CustomColors.warnahitam
                          : CustomColors.warnaputih,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
