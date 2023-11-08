import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/data/componen/images.dart';
import 'package:rskgcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:rskgcare/app/modules/profile-view/views/profile_view_view.dart';
import 'package:rskgcare/app/modules/register_rs/views/widgets/jadwal_praktik.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../routes/app_pages.dart';
import '../color/custom_color.dart';
import '../text/string_text.dart';

class CardListViewPoli extends StatelessWidget {
  final Items items;
  final bool isNoHome;

  const CardListViewPoli(
      {super.key, required this.items, required this.isNoHome});

  @override
  Widget build(BuildContext context) {
    String tag = items.toJson().toString();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: InkWell(
        onTap: () => isNoHome == false
            ? showModalBottomSheet(
                showDragHandle: true,
                context: context,
                isDismissible: true,
                enableDrag: false,
                useSafeArea: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.99,
                    child:
                        buildSheetklompokjadwal(items: items, context: context),
                  );
                },
              )
            : showModalBottomSheet(
                showDragHandle: true,
                context: context,
                enableDrag: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => buildSheet(),
              ),
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.warnaabu),
            color: Theme.of(context).brightness == Brightness.light
                ? CustomColors.warnaputih
                : CustomColors.darkmode2,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: InkWell(
                  onTap: () => context.pushTransparentRoute(
                    AlertDialog(
                      title: const Text("Profile Dokter"),
                      content: ProfileViewView(
                        src: items.foto!,
                        tag: tag,
                      ),
                    ),
                    backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                    transitionDuration: const Duration(
                      milliseconds: 700,
                    ),
                    reverseTransitionDuration: const Duration(
                      milliseconds: 700,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: tag,
                      child: Image.network(
                        items.foto ?? Avatar.lakiLaki,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5),
                    Container(
                        padding: const EdgeInsets.only(
                            right: 0, left: 5, bottom: 15, top: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CustomColors.warnabirumuda1
                                  : CustomColors.darkmode1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items.namaPegawai!,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? CustomColors.warnahitam
                                            : CustomColors.warnaputih,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TextScroll(
                                        items.namaBagian!,
                                        textDirection: TextDirection.ltr,
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.warnabiru,
                                          fontSize: 14,
                                        ),
                                        intervalSpaces: 10,
                                        velocity: const Velocity(
                                            pixelsPerSecond: Offset(10, 0)),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSheetklompokjadwal(
      {required Items items, required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/calendar.png',
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 290,
                        child: Text(
                          items.msgDokter ?? '',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? CustomColors.warnahitam
                                  : CustomColors.warnaputih,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 260,
                        child: Text(
                          items.namaPegawai ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 270,
                        child: Text(
                          items.namaBagian ?? '',
                          style: const TextStyle(
                              color: CustomColors.warnabiru, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CustomColors.warnabirumuda1
                                  : CustomColors.darkmode2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Jadwal Praktik',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? CustomColors.warnahitam
                                      : CustomColors.warnaputih,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            items.jadwal == null
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        right: 100, left: 100),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/nojadwal.png',
                                          height: 150,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ))
                                : Column(
                                    children: items.jadwal!
                                        .map(
                                          (e) => JadwalPraktik(
                                              jadwal: e, items: items),
                                        )
                                        .toList(),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Text(
                      "Anda Belum Terdaftar atau Login di Aplikasi SIRS ${CustomStringText().namaRS}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                      "Silahkan daftar atau Login untuk bisa melakukan registrasi poliklinik",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/login_sukses.png",
                    gaplessPlayback: true,
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: CustomColors.warnahijau,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Login / Regist",
                                      style: TextStyle(
                                          color: CustomColors.warnaputih,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 0, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: CustomColors.warnaabu,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          color: CustomColors.warnahitam,
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
