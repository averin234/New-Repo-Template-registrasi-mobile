import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../data/componen/images.dart';
import '../../data/model/regist_rs/all_dokter_klinik.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/profile-view/views/profile_view_view.dart';
import '../../modules/register_rs/views/widgets/jadwal_praktik.dart';
import '../endpoint/fetch_data.dart';


class VerticalSliderHome extends GetView<HomeController> {
  const VerticalSliderHome({super.key});

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
              items: List.generate(5, (index) => Item1(items: data[index])),
            );
          } else {
            return Container();
          }
        });
  }
}

class Item1 extends StatelessWidget {
  final Items items;
  const Item1({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String formattedDays;
    // List<String> days = items.jadwal![0].rangeHari!.split(",");
    // if (days.length <= 1) {
    //   formattedDays = days.first;
    // } else {
    //   formattedDays =
    //       "${days.getRange(0, days.length - 1).join(', ')} dan ${days.last}";
    // }
    String tag = items.toJson().toString();
    return Container(
      margin: const EdgeInsets.only(bottom: 28, left: 5, right: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color(0xff404258),
        border: Border.all(color: const Color(0x6cc7d1db)),
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
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) =>
                      buildSheetklompokjadwal(items: items, context: context),
                );
              },
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
                        color: Colors.blue,
                        fontSize: 11),
                    intervalSpaces: 10,
                    velocity: const Velocity(
                      pixelsPerSecond: Offset(1, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // TextScroll(
                  //   formattedDays,
                  //   style: GoogleFonts.nunito(
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //     fontSize: 13,
                  //   ),
                  //   intervalSpaces: 10,
                  //   velocity: const Velocity(
                  //     pixelsPerSecond: Offset(1, 0),
                  //   ),
                  // ),
                  // Text(
                  //   "${intl.DateFormat('HH:mm').format(DateTime.parse(items.jadwal![0].jamMulai!))} - ${intl.DateFormat('HH:mm').format(DateTime.parse(items.jadwal![0].jamAkhir!))}",
                  //   style: GoogleFonts.nunito(
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //     fontSize: 13,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
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
                                  ? Colors.black
                                  : Colors.white,
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
                          style:
                          const TextStyle(color: Colors.blue, fontSize: 13),
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
                              ? Color(0xffecf8ff)
                              : Color(0xff404258),
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
                                      ? Colors.black
                                      : Colors.white,
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
}