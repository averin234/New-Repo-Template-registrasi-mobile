import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/widgets/card/card_detail_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../widgets/card/card_Resep_view.dart';
import '../../../widgets/card/card_tindakan_view.dart';
import '../../../widgets/card/card_title_resep.dart';
import '../../../widgets/card/card_vitalsign_view.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/text/string_text.dart';
import '../controllers/detail_riwayat_controller.dart';

class DetailRiwayatView extends StatefulWidget {
  const DetailRiwayatView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DetailRiwayatViewState createState() => _DetailRiwayatViewState();
}

class _DetailRiwayatViewState extends State<DetailRiwayatView> {
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

  final controller = Get.put(DetailRiwayatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? CustomColors.warnabirumuda1
          : CustomColors.darkmode1,
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(),
        onLoading: _onLoading,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? CustomColors.warnaputih
                  : CustomColors.darkmode1,
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
                "${CustomStringText().RiwayatPasien}",
                style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              bottom: AppBar(
                toolbarHeight: 0,
              ),
            ),
            // Other Sliver Widgets
            SliverList(
              delegate: SliverChildListDelegate([
                FutureBuilder(
                    future: API.getDetailRiwayat(id: controller.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState != ConnectionState.waiting &&
                          snapshot.data != null) {
                        final data = snapshot.data!;
                        return Column(
                          children: [
                            CardDetailViewRiwayat(
                                px: data.px![0],
                                dataRegist: controller.dataRegist.value),
                            const SizedBox(
                              height: 5,
                            ),
                            data.vitalSign == null
                                ? Container()
                                : CardVitalSign(vitalSign: data.vitalSign![0]),
                            const SizedBox(
                              height: 5,
                            ),
                            data.tindakan == null
                                ? Container()
                                : CardTindakan(tindakan: data.tindakan!),
                            // data.icd10 == null
                            //     ? Container()
                            //     : CardICD10(icd10: data.icd10!),
                            const WidgetTitleResep(),
                            data.resep == null
                                ? Container()
                                : CardResep(resep: data.resep!),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ]),
            ),
          ],
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
      DetailRiwayatView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
