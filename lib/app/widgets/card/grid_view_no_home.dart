import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/routes/app_pages.dart';
import '../../../generated/assets.dart';
import '../color/custom_color.dart';
import '../font_size/my_font_size.dart';
import 'custom_card.dart';
import '../text/string_text.dart';

class WidgetStraggeredGridView extends StatelessWidget {
  const WidgetStraggeredGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              Get.toNamed(Routes.REGISTER_RS, arguments: true);
            },
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                  shadow: false,
                  height: 50,
                  width: 50,
                  borderRadius: BorderRadius.circular(100),
                  child: Center(
                    child: SvgPicture.asset("assets/images/regis.svg"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${CustomStringText().RegistrasiRS}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
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
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/tele.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${CustomStringText().RegistrasiHemodalisa}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
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
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/antri.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${CustomStringText().DaftarAntrean}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
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
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/riwayat.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${CustomStringText().RiwayatMedis}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
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
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: SvgPicture.asset("assets/images/profile.svg"),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${CustomStringText().ProfilePasien1}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () => showModalBottomSheet(
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
            shadow: false,
            shadowBlur: 0,
            width: double.infinity,
            bgColor: CustomColors.warnaputih,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 60,
                    borderRadius: BorderRadius.circular(100),
                    child: Center(
                      child: Image.asset(
                        Assets.imagesInfo,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${CustomStringText().NamaRS2}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: MyFontSize.small3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
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
        child: Column(
          children: [
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  Text(
                      "Anda Belum Terdaftar atau Login di Aplikasi ${CustomStringText().namaRS}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      " ${CustomStringText().registrasipoliklinik}",
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
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 0, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[100],
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
