// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rskgcare/app/modules/register_rs/views/widgets/cari_dokter.dart';
import 'package:rskgcare/app/modules/register_rs/views/widgets/nospesialisasi.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:rskgcare/app/modules/register_rs/controllers/register_rs_controller.dart';
import 'package:rskgcare/app/widgets/componen/dropdownSpesialisasi.dart';
import 'package:rskgcare/app/widgets/card/card_listview_poli.dart';
import 'package:rskgcare/app/widgets/card/card_title_poli.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/font_size/my_font_size.dart';
import '../../../widgets/shammer/shimmer_listview.dart';
import '../../home/views/home_view.dart';

class RegisterRsView extends StatefulWidget {
  const RegisterRsView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RegisterRsViewState createState() => _RegisterRsViewState();
}

class _RegisterRsViewState extends State<RegisterRsView> {
  // this enable our app to able to pull down
  final updateController = Get.put(RegisterRsController());
  late final String currentVersion;

  late RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }

  final controller = Get.put(RegisterRsController());

  @override
  Widget build(BuildContext context) {
    updateController.checkForUpdate();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  HomeView1()), // Ganti dengan halaman home Anda
        );
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: WaterDropHeader(),
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? CustomColors.warnaputih
                          : CustomColors.darkmode1,
                  automaticallyImplyLeading: true,
                  floating: true,
                  pinned: true,
                  snap: true,
                  stretch: true,
                  leading: IconButton(
                      icon: const Icon(Icons.arrow_circle_left_rounded),
                      color: CustomColors.warnabiru,
                      iconSize: 40,
                      onPressed: () {
                        Get.back();
                      }),
                  title: Text(
                    "Pilih Poli",
                    style: GoogleFonts.nunito(
                        fontSize: MyFontSize.large1,
                        fontWeight: FontWeight.bold),
                  ),
                  actions: const [],
                  bottom: AppBar(
                    backgroundColor: const Color(0xff4babe7),
                    toolbarHeight: 100,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    title: Column(
                      children: [
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Pilih Spesialis',
                              style: TextStyle(
                                  fontSize: 13, color: CustomColors.warnaputih),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              'Cari Dokter/Spesialis',
                              style: TextStyle(
                                  fontSize: 13, color: CustomColors.warnaputih),
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: DropDownListExample()),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: CariDokter()),
                          ],
                        ),
                        // DropDownListExample(),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
                // Other Sliver Widgets
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const WidgetTitlePoli(),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CustomColors.background
                                  : CustomColors.darkmode1,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFe0e0e0).withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(2, 1),
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text('Daftar Dokter Spesialisasi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(() {
                                return FutureBuilder(
                                  future: API.getAllDokterKlinik(
                                      filter: controller.namaBagian.value),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.connectionState !=
                                            ConnectionState.waiting &&
                                        snapshot.data != null) {
                                      GetAllDokterKlinik getAllDokterKlinik =
                                          snapshot.data ?? GetAllDokterKlinik();
                                      return Column(
                                        children: AnimationConfiguration
                                            .toStaggeredList(
                                          duration:
                                              const Duration(milliseconds: 475),
                                          childAnimationBuilder: (widget) =>
                                              SlideAnimation(
                                            child: FadeInAnimation(
                                              child: widget,
                                            ),
                                          ),
                                          children: getAllDokterKlinik.items !=
                                                  null
                                              ? getAllDokterKlinik.items!
                                                  .map((e) {
                                                  return CardListViewPoli(
                                                    items: e,
                                                    isNoHome:
                                                        controller.isNoHome,
                                                  );
                                                }).toList()
                                              : [const CardNoSpesialisasi()],
                                        ),
                                      );
                                    } else {
                                      return SizedBox(
                                        height: Get.height - 250,
                                        child: const Center(
                                            child: shimmerListViewPoli()),
                                      );
                                    }
                                  },
                                );
                              }),
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onLoading() {
    _refreshController
        .loadComplete(); // after data returned,set the //footer state to idle
  }

  _onRefresh() {
    setState(() {
// so whatever you want to refresh it must be inside the setState
      RegisterRsView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
