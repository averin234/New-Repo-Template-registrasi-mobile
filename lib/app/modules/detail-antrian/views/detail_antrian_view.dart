import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/card/card_ticket_antrian.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/font_size/my_font_size.dart';
import '../../../widgets/text/string_text.dart';
import '../../daftar_antrian/views/daftar_antrian_view.dart';
import '../controllers/detail_antrian_controller.dart';

class DetailAntrianView extends StatefulWidget {
  const DetailAntrianView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DetailAntrianViewState createState() => _DetailAntrianViewState();
}

class _DetailAntrianViewState extends State<DetailAntrianView> {
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

  final controller = Get.put(DetailAntrianController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  DaftarAntrianView()), // Ganti dengan halaman home Anda
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? CustomColors.warnabirumuda1
            : CustomColors.darkmode1,
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
                    "${CustomStringText().DetailAntrean}",
                    style: GoogleFonts.nunito(
                        fontSize: MyFontSize.large1,
                        fontWeight: FontWeight.bold),
                  ),
                  actions: const [
                    // IconButton(
                    //     onPressed: () => Navigator.of(context)
                    //         .push(MaterialPageRoute(builder: (_) => const SearchPage())),
                    //     icon: const Icon(Icons.search))
                  ],
                  bottom: AppBar(
                    toolbarHeight: 0,
                  ),
                ),
                // Other Sliver Widgets
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => ScaleAnimation(
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                          children: <Widget>[
                            const CardTicketAntrian(),
                          ]),
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
      DetailAntrianView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
