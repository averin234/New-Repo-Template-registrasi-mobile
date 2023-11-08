import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/routes/app_pages.dart';
import '../../../widgets/card/card_info_rs.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/card/card_no_antri.dart';
import '../../../widgets/card/card_slider_poli_no_home.dart';
import '../../../widgets/card/grid_view_no_home.dart';
import '../../../widgets/card/card_text_raw.dart';
import '../../../widgets/font_size/my_style.dart';
import '../../../widgets/shammer/nohome.dart';
import '../../../widgets/text/string_text.dart';

class NoHomeView extends StatefulWidget {
  const NoHomeView({Key? key}) : super(key: key);

  @override
  State<NoHomeView> createState() => _NoHomeViewState();
}

class _NoHomeViewState extends State<NoHomeView> {
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
        actions: [
          TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            child: Text(
              "${CustomStringText().MasukDaftar}",
              style: GoogleFonts.nunito(
                fontSize: 16.0,
                color: Theme.of(context).brightness == Brightness.light
                    ? CustomColors.warnabiru
                    : CustomColors.warnaputih,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Your refresh logic goes here
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            entries.add(entries.length);
          });
        },
        child: FutureBuilder(
            future: API.getToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting &&
                  snapshot.data != null) {
                return ListView(
                  children: [
                    FutureBuilder(
                      future: API.getDetailKlinik(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!;
                          return WidgetInfo(
                            detailklinik: data,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                      child: Text(
                        "${CustomStringText().Antreanaatini}",
                        style: MyStyle.textTitleBlack,
                      ),
                    ),
                    const WidgetNoAntri(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 20, left: 20),
                      child: Text(
                        "${CustomStringText().LayananUtama}",
                        style: MyStyle.textTitleBlack,
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          VerticalSliderDemo(),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const nohome();
              }
            }),
      ),
    );
  }
}
