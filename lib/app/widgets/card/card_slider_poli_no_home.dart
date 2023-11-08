import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/componen/images.dart';
import 'package:rskgcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:rskgcare/app/modules/home/controllers/home_controller.dart';
import 'package:rskgcare/app/modules/profile-view/views/profile_view_view.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../routes/app_pages.dart';
import '../color/custom_color.dart';
import '../text/string_text.dart';

class VerticalSliderDemo extends GetView<HomeController> {
  const VerticalSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API.getAllDokterKlinik(filter: ''),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting &&
              snapshot.data != null) {
            final data = snapshot.data!.items!;
            return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.5,
              ),
              items: List.generate(
                  5,
                  (index) => Item1(
                        items: data[index],
                      )),
            );
          } else {
            return Container();
          }
        });
  }
}

class Item1 extends StatelessWidget {
  final Items items;
  const Item1({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tag = items.toJson().toString();
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? CustomColors.warnaputih
            : CustomColors.darkmode2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
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
            child: SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Hero(
                  tag: tag,
                  child: Image.network(
                    items.foto ?? Avatar.lakiLaki,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () => showModalBottomSheet(
                showDragHandle: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => buildSheet(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items.namaPegawai!,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextScroll(
                    items.namaBagian!,
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.warnabiru,
                        fontSize: 11),
                    intervalSpaces: 10,
                    velocity: const Velocity(
                      pixelsPerSecond: Offset(1, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Center(
        child: Column(
          children: [
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Text(
                      "Anda Belum Terdaftar atau Login di Aplikasi SIRS ${CustomStringText().namaRS}",
                      style: TextStyle(
                          color: CustomColors.warnahitam,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                      "Silahkan daftar atau Login untuk bisa melakukan registrasi poliklinik",
                      style: TextStyle(
                          color: CustomColors.warnahitam, fontSize: 15),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/login_sukses.png",
                    gaplessPlayback: true,
                    fit: BoxFit.fitHeight,
                    width: 200,
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
                            const EdgeInsets.only(right: 70, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: CustomColors.warnabiru,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Cancel",
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
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.greenAccent,
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
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
