import 'package:flutter/material.dart';
import 'package:sirs_averin/app/widgets/card/card_antri.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sirs_averin/app/widgets/endpoint/fetch_data.dart';
import 'package:sirs_averin/app/data/componen/images.dart';
import 'package:sirs_averin/app/widgets/card/grid_view_home.dart';
import 'package:sirs_averin/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_page/search_page.dart';
import '../../../data/model/regist_rs/all_dokter_klinik.dart';
import '../../../widgets/card/card_listview_poli.dart';
import '../../../widgets/card/card_no_antri.dart';
import '../../../widgets/card/card_slider_poli_home.dart';
import '../../../widgets/card/card_text_raw.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/shammer/shimmer_antrihome.dart';
import '../../../widgets/text/string_text.dart';
import '../controllers/home_controller.dart';

class HomeView1 extends StatefulWidget {
  const HomeView1({super.key});

  @override
  State<HomeView1> createState() => _HomeView1State();
}

class _HomeView1State extends State<HomeView1> {
  final controller = Get.put(HomeController());
  final updateController = Get.put(HomeController());
  late final String currentVersion;
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      entries.add(entries.length);
    });
    _refreshController.refreshCompleted();
  }

  List<int> entries = List<int>.generate(5, (int i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? CustomColors.background
            : CustomColors.darkmode1,
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? CustomColors.background
                : CustomColors.darkmode1,
            title: ListTile(
              leading: GestureDetector(
                onTap: () => Get.toNamed(Routes.SETTING_PROFILE),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    controller.dataRegist.value.fotoPasien != 'null'
                        ? controller.dataRegist.value.fotoPasien!
                        : controller.dataRegist.value.jenisKelamin == 'L'
                            ? Avatar.lakiLaki
                            : Avatar.perempuan,
                  ),
                ),
              ),
              title: Text(
                '👋 Hi, ${controller.dataRegist.value.namaPasien ?? ''}',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              subtitle: Text(
                controller.dataRegist.value.noKtp ?? '',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            actions: [
              FutureBuilder(
                  future: API.getAllDokterKlinik(filter: ''),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.items!;
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 15, right: 10, top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
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
                                    items: dokter, isNoHome: false),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 6,
                                ),
                                Icon(Icons.search_rounded,
                                    color: Colors.grey, size: 20),
                                Text('Cari Dokter',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ],
            automaticallyImplyLeading: false,
            elevation: 1,
            shadowColor: CustomColors.warnabiru),
        body: HomeView());
  }

  Widget HomeView() {
    updateController.checkForUpdate();
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      // ListView, CustomScrollView, etc. here
      child: ListView(
        children: [
          // FutureBuilder(
          //   future: API.getDetailKlinik(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData &&
          //         snapshot.connectionState != ConnectionState.waiting &&
          //         snapshot.data != null) {
          //       final data = snapshot.data!;
          //       return WidgetInfo(
          //         detailklinik: data,
          //       );
          //     } else {
          //       return const shimmernohome();
          //     }
          //   },
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(CustomStringText().Antreanaatini,
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          FutureBuilder(
            future: API.getJadwalPx(
              noKtp: controller.dataRegist.value.noKtp ?? '',
              tgl: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting &&
                  snapshot.data != null) {
                if (snapshot.data!.code == 200) {
                  final data = snapshot.data!.list!.first;
                  return FutureBuilder(
                      future: API.getDataPx(
                          noKtp: controller.dataRegist.value.noKtp ?? ''),
                      builder: (context, snapshot1) {
                        if (snapshot1.hasData &&
                            snapshot1.connectionState !=
                                ConnectionState.waiting &&
                            snapshot1.data != null) {
                          final scan = snapshot1.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 0, bottom: 15)),
                              WidgetCard(lists: {'data': data, 'scan': scan}),
                            ],
                          );
                        } else {
                          return Container(
                              margin: const EdgeInsets.only(right: 20, top: 10),
                              child: const shimmerAntriHome());
                        }
                      });
                } else {
                  return const WidgetNoAntri();
                }
              } else {
                return Container(
                    margin: const EdgeInsets.only(right: 20, top: 10),
                    child: const shimmerAntriHome());
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(
              CustomStringText().LayananUtama,
              style:
                  GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const WidgetStraggeredGridView(),
          const WidgetTitle2(),
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/frame1.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe0e0e0).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.all(0),
            child: const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                VerticalSliderHome(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomeView1();
  }
}
