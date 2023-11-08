import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:rskgcare/app/data/componen/images.dart';
import 'package:rskgcare/app/widgets/card/card_form_poli.dart';
import 'package:rskgcare/app/widgets/card/card_jadwa_poli_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../widgets/endpoint/fetch_data.dart';
import '../../../data/model/regist_rs/daftar_px.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/custom_dialog/dialog_registrasi_gagal_regis.dart';
import '../../../widgets/custom_dialog/dialog_registrasi_poli.dart';
import '../../../widgets/custom_dialog/dialog_registrasi_sukses.dart';
import '../../../widgets/text/string_text.dart';
import '../controllers/detail_poli_controller.dart';

class DetailPoliView extends StatefulWidget {
  const DetailPoliView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DetailPoliViewState createState() => _DetailPoliViewState();
}

class _DetailPoliViewState extends State<DetailPoliView> {
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

  final controller = Get.put(DetailPoliController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                elevation: 1,
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? CustomColors.background
                        : CustomColors.darkmode1,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    controller.items.foto ?? Avatar.lakiLaki,
                    fit: BoxFit.contain,
                  ),
                ),
                floating: true,
                pinned: true,
                snap: true,
                stretch: true,
                centerTitle: true,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                    color: CustomColors.warnabiru,
                    iconSize: 40,
                    onPressed: () {
                      Get.back();
                    }),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 675),
                      childAnimationBuilder: (widget) => ScaleAnimation(
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: <Widget>[
                        const CardListViewPoliDetail(),
                        const CardFromPoli(),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? CustomColors.warnaputih
              : CustomColors.darkmode2,
        ),
        height: 75,
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("${CustomStringText().PilihKunjungan}",
                          style: TextStyle())),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.warnabiru,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () async {
                    if (controller.noAntrianController.value.text.isNotEmpty) {
                      final namaKlinik = await API.getDetailKlinik();
                      final daftarAntrian = await API.getJadwalPx(
                        noKtp: controller.dataRegist.value.noKtp!,
                        tgl: controller.jadwalController.value.text,
                      );

                      if (daftarAntrian.code == 200) {
                        final daftarPx = await API.postDaftarPx(
                          namaPasien: controller.namaController.text,
                          jadwal: controller.listAntrianDokter.value.jam ?? '',
                          noAntrian: controller.noAntrianController.value.text,
                          noKtp: controller.dataRegist.value.noKtp ?? '',
                          kodeDokter: controller.items.kodeDokter ?? '',
                          kodeBagian: controller.items.kodeBagian ?? '',
                          namaBagian: controller.items.namaBagian ?? '',
                          namaKlinik:
                              namaKlinik.res!.first.namaPerusahaan ?? '',
                          namaDokter: controller.items.namaPegawai ?? '',
                          durasi:
                              controller.listAntrianDokter.value.durasi ?? '',
                          ketKlinik: 'Baru',
                          tglDaftar: controller.jadwalController.text,
                        );
                        Get.defaultDialog(
                          title: '${CustomStringText().SudahTerdaftar}',
                          cancel: InkWell(
                            onTap: () async {
                              Get.back();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColors.warnaabu2),
                              child: Center(
                                child: Text('${CustomStringText().Kembali}',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          content: Column(
                            children: [
                              Image.asset(
                                "assets/images/sudah_regis.png",
                                gaplessPlayback: true,
                                fit: BoxFit.fitHeight,
                                height: 200,
                              ),
                              Text(daftarPx.msg.toString(),
                                  style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        );
                        // Get.dialog(DialogGagalRegis(
                        //     daftarPx: DaftarPx.fromJson(daftarPx.toJson())));
                      } else {
                        final getDataPx = await API.getDataPx(
                            noKtp: controller.dataRegist.value.noKtp ?? '');
                        if (getDataPx.code == 200) {
                          final daftarPx = await API.postDaftarPx(
                            namaPasien: controller.namaController.text,
                            jadwal:
                                controller.listAntrianDokter.value.jam ?? '',
                            noAntrian:
                                controller.noAntrianController.value.text,
                            noKtp: controller.dataRegist.value.noKtp ?? '',
                            kodeDokter: controller.items.kodeDokter ?? '',
                            kodeBagian: controller.items.kodeBagian ?? '',
                            namaBagian: controller.items.namaBagian ?? '',
                            namaKlinik:
                                namaKlinik.res!.first.namaPerusahaan ?? '',
                            namaDokter: controller.items.namaPegawai ?? '',
                            durasi:
                                controller.listAntrianDokter.value.durasi ?? '',
                            ketKlinik: 'Baru',
                            tglDaftar: controller.jadwalController.text,
                          );
                          Get.back();
                          if (daftarPx.code == 500) {
                            Get.defaultDialog(
                              title: '${CustomStringText().SudahTerdaftar}',
                              cancel: InkWell(
                                onTap: () async {
                                  Get.back();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CustomColors.warnaabu2),
                                  child: Center(
                                    child: Text('${CustomStringText().Kembali}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              content: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/sudah_regis.png",
                                    gaplessPlayback: true,
                                    fit: BoxFit.fitHeight,
                                    height: 200,
                                  ),
                                  Text(daftarPx.msg.toString(),
                                      style: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            );
                          } else if (daftarPx.code == 200) {
                            Get.defaultDialog(
                              title: '${CustomStringText().janjiTemu}',
                              cancel: InkWell(
                                onTap: () async {
                                  Get.back();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CustomColors.warnaabu2),
                                  child: Center(
                                    child: Text('${CustomStringText().Kembali}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              content: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/regis_poli.png",
                                    gaplessPlayback: true,
                                    fit: BoxFit.fitHeight,
                                    height: 200,
                                  ),
                                  Text(
                                      '${CustomStringText().FOatauQRCode}',
                                      textAlign: TextAlign.center),
                                ],
                              ),
                              confirm: InkWell(
                                onTap: () async {
                                  Get.back();
                                  Get.toNamed(Routes.DAFTAR_ANTRIAN);
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CustomColors.warnabiru),
                                  child: Center(
                                    child: Text('Lihat Antrean',
                                        style: TextStyle(
                                            color: CustomColors.warnaputih,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            );
                            // Get.dialog(const DialogSuksesRegis());
                          }
                        } else {
                          Get.defaultDialog(
                            title: 'Informasi',
                            cancel: InkWell(
                              onTap: () async {
                                Get.back();
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CustomColors.warnaabu2),
                                child: Center(
                                  child: Text('${CustomStringText().Kembali}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            content: Column(
                              children: [
                                Image.asset(
                                  "assets/images/regis_poli2.png",
                                  gaplessPlayback: true,
                                  fit: BoxFit.fitHeight,
                                  height: 200,
                                ),
                                Text(
                                    'Anda Belum Tedaftar Sebagai Pasien di ${CustomStringText().namaRS} Apakah anda ingin mendaftar sebagaipasien baru?',
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            confirm: InkWell(
                              onTap: () async {
                                final daftarPx = await API.postDaftarPx(
                                  namaPasien: controller.namaController.text,
                                  jadwal:
                                      controller.listAntrianDokter.value.jam ??
                                          '',
                                  noAntrian: (controller.listAntrianDokter.value
                                              .antrian ??
                                          0)
                                      .toString(),
                                  noKtp:
                                      controller.dataRegist.value.noKtp ?? '',
                                  kodeDokter: controller.items.kodeDokter ?? '',
                                  kodeBagian: controller.items.kodeBagian ?? '',
                                  namaBagian: controller.items.namaBagian ?? '',
                                  namaKlinik: '${CustomStringText().namaRS}',
                                  namaDokter:
                                      controller.items.namaPegawai ?? '',
                                  durasi: controller
                                          .listAntrianDokter.value.durasi ??
                                      '',
                                  ketKlinik: 'Baru',
                                  tglDaftar: controller.jadwalController.text,
                                );
                                if (daftarPx.code.toString() == '500') {
                                  Get.defaultDialog(
                                    title: '${CustomStringText().SudahTerdaftar}',
                                    cancel: InkWell(
                                      onTap: () async {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: CustomColors.warnaabu2),
                                        child: Center(
                                          child: Text('${CustomStringText().Kembali}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    content: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/sudah_regis.png",
                                          gaplessPlayback: true,
                                          fit: BoxFit.fitHeight,
                                          height: 200,
                                        ),
                                        Text(daftarPx.msg.toString(),
                                            style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 14,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  );
                                } else if (daftarPx.code.toString() == '200') {
                                  Get.back();
                                  Get.defaultDialog(
                                    title: '${CustomStringText().janjiTemu}',
                                    cancel: InkWell(
                                      onTap: () async {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: CustomColors.warnaabu2),
                                        child: Center(
                                          child: Text('Kembali',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    content: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/regis_poli.png",
                                          gaplessPlayback: true,
                                          fit: BoxFit.fitHeight,
                                          height: 200,
                                        ),
                                        Text(
                                            '${CustomStringText().FOatauQRCode}',
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    confirm: InkWell(
                                      onTap: () async {
                                        Get.back();
                                        Get.toNamed(Routes.DAFTAR_ANTRIAN);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: CustomColors.warnabiru),
                                        child: Center(
                                          child: Text('${CustomStringText().LihatAntrean}',
                                              style: TextStyle(
                                                  color:
                                                      CustomColors.warnaputih,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CustomColors.warnabiru),
                                child: Center(
                                  child: Text('${CustomStringText().Lanjut}',
                                      style: TextStyle(
                                          color: CustomColors.warnaputih,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          );
                          // Get.dialog(
                          //   const DialogRegisPoli(),
                          // );
                        }
                      }
                    } else {
                      Get.dialog(
                        DialogGagalRegis(
                          daftarPx: DaftarPx(
                            msg:
                                '${CustomStringText().CariDokter}',
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('${CustomStringText().Lanjutkan}'),
                ),
              ),
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
      DetailPoliView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
