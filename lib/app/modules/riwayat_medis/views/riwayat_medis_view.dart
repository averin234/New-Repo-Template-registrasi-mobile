import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/modules/riwayat_medis/controllers/riwayat_medis_controller.dart';
import 'package:rskgcare/app/widgets/card/card_listview_riwayat.dart';
import 'package:rskgcare/app/widgets/card/card_title_riwayat.dart';
import 'package:rskgcare/app/widgets/card/card_title_riwayat2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/card/card_no_antri.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/font_size/my_font_size.dart';
import '../../../widgets/shammer/shimmer_rmr.dart';
import '../../home/views/home_view.dart';

class RiwayatMedisView extends StatefulWidget {
  const RiwayatMedisView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RiwayatMedisViewState createState() => _RiwayatMedisViewState();
}

class _RiwayatMedisViewState extends State<RiwayatMedisView> {
  // this enable our app to able to pull down
  late RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }

  final controller = Get.put(RiwayatMedisController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  HomeView()), // Ganti dengan halaman home Anda
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
                  elevation: 1,
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
                    "Riwayat Medis",
                    style: GoogleFonts.nunito(
                        fontSize: MyFontSize.large1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Other Sliver Widgets
                SliverList(
                  delegate: SliverChildListDelegate([
                    const WidgetTitleRiwayat2(),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? CustomColors.background
                                    : CustomColors.darkmode1,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
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
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const WidgetTitleRiwayat3(),
                              SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                return FutureBuilder(
                                    future: API.getListMr(
                                      noKtp: controller.dataRegist.value.noKtp!,
                                      tgl: controller.date.value,
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState !=
                                              ConnectionState.waiting &&
                                          snapshot.data != null) {
                                        final data = snapshot.data!;
                                        return Column(
                                          children: AnimationConfiguration
                                              .toStaggeredList(
                                            duration: const Duration(
                                                milliseconds: 475),
                                            childAnimationBuilder: (widget) =>
                                                SlideAnimation(
                                              child: FadeInAnimation(
                                                child: widget,
                                              ),
                                            ),
                                            children: data.res != null
                                                ? data.res!
                                                    .map(
                                                      (e) =>
                                                          CardListViewRiawayat(
                                                              res: e),
                                                    )
                                                    .toList()
                                                : [WidgetNoAntri()],
                                          ),
                                        );
                                      } else {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            shimmerRMR(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            shimmerRMR(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            shimmerRMR(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            shimmerRMR(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            shimmerRMR(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            shimmerRMR(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        );
                                      }
                                    });
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
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
      RiwayatMedisView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}

// Search Page
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Cari Dokter/Spesialisasi',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
