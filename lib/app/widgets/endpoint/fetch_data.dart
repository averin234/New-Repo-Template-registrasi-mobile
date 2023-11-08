import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rskgcare/app/data/componen/data_regist_model.dart';
import 'package:rskgcare/app/data/componen/local_storage.dart';
import 'package:rskgcare/app/data/componen/publics.dart';
import 'package:rskgcare/app/data/model/antrian_rs/jadwal_px.dart';
import 'package:rskgcare/app/data/model/antrian_rs/jadwal_px_detail.dart';
import 'package:rskgcare/app/data/model/homepage/detail_klinik.dart';
import 'package:rskgcare/app/data/model/homepage/poli.dart';
import 'package:rskgcare/app/data/model/login_and_regist/akses_px.dart';
import 'package:rskgcare/app/data/model/login_and_regist/daftar_px_baru.dart';
import 'package:rskgcare/app/data/model/login_and_regist/token.dart';
import 'package:rskgcare/app/data/model/mr_pasien/detailRiwayat.dart';
import 'package:rskgcare/app/data/model/mr_pasien/listMRPX.dart';
import 'package:rskgcare/app/data/model/profile_pasien/data_pasien.dart';
import 'package:rskgcare/app/data/model/profile_pasien/data_px.dart';
import 'package:rskgcare/app/data/model/regist_hemo/asuransi.dart';
import 'package:rskgcare/app/data/model/regist_hemo/dokter_hemo.dart';
import 'package:rskgcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:rskgcare/app/data/model/regist_rs/antrian_dokter.dart';
import 'package:rskgcare/app/data/model/regist_rs/dokter_by_name.dart';
import 'package:rskgcare/app/routes/app_pages.dart';

import '../../data/model/antrian_rs/jadwal_px_hemo.dart';
import '../../data/model/login_and_regist/CheckUp.dart';
import '../../data/model/regist_hemo/daftar_hemo.dart';

class API {
  // static const _url = 'https://rskg.sirs.co.id/';
  static const _url = 'https://rskg.sirs.co.id/';
  // static const _url = 'https://rsbk.sirs.co.id/';
  static const _baseUrl = '${_url}api/v1';
  static const _kodeKlinik = 'C00003';
  static const _getToken = '$_baseUrl/get-token.php';
  static const _getAksesPx = '$_baseUrl/px-akses.php';
  static const _postDaftarPxBaru = '$_baseUrl/post-daftar-px-baru.php';
  static const _getPoli = '$_baseUrl/get-poli.php';
  static const _getAllDokterKlinik = '$_baseUrl/get-all-dokter-klinik.php';
  static const _getDokterKlinik = '$_baseUrl/get-dokter-klinik.php';
  // static const _getAntrianDokter = '$_baseUrl/get-antrian-dokter-new.php';
  static const _getAntrianDokter = '$_baseUrl/get-antrian-dokter.php';
  static const _postDaftarPx = '$_baseUrl/post-daftar-px.php';
  static const _getLupaPassword = "$_baseUrl/post-lupa-password.php";
  static const _postUbahPassword = "$_baseUrl/post-ubah-password.php";
  static const _getAsuransiPx = '$_baseUrl/get-asuransi-px.php';
  static const _getDokterHemo = '$_baseUrl/get-dokter-hemo.php';
  static const _postDaftarHemo = '$_baseUrl/post-daftar-hemo.php';
  static const _getJadwalPx = '$_baseUrl/get-jadwal-px.php';
  static const _getJadwalHemoPx = '$_baseUrl/get-jadwal-hemo-px.php';
  static const _getJadwalPxDetail = '$_baseUrl/get-jadwal-px-detail.php';
  static const _getJadwalHemoDetail = '$_baseUrl/get-jadwal-hemo-detail.php';
  // static const _scanantreanKlinik = '$_baseUrl/scan_antrean_klinik.php';
  static const _scanAntrianKlinik = '$_baseUrl/scan_antrian_klinik.php';
  static const _getDataPasien = '$_baseUrl/get-data-pasien.php';
  static const _getDataPx = '$_baseUrl/get-data-px.php';
  static const _cekDataPx = '$_baseUrl/cek-data-px.php';
  static const _editPasienLama = '$_baseUrl/edit_pasien_lama.php';
  static const _editFotoPasien = '$_baseUrl/edit_foto_pasien.php';
  static const _editFotoKtp = '$_baseUrl/edit_foto_ktp.php';
  static const _getListMr = '$_baseUrl/get-list-mr.php';
  static const _getDetailHistory = '$_baseUrl/get-detail-riwayat.php';
  static const _getFotoRad = '$_baseUrl/get-foto-rad.php';
  static const _getCetakResep = '$_baseUrl/get-cetak-resep.php';
  static const _getKlinikDetail = '$_baseUrl/get-klinik-detail.php';

  static Future<Token> getToken() async {
    var response = await Dio().post(_getToken, data: {
      "KeyCode": "MeTiRs",
      "v": "1",
    });
    final data = jsonDecode(response.data);
    final obj = Token.fromJson(data);
    await LocalStorages.setToken(obj);
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> CekLupaPassword({
    required String email,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "em": email,
    };
    var response = await Dio().post(
      _getLupaPassword,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<CheckUp> postUbahPassword({
    required String email,
    required String pw_lama,
    required String pw_baru,
  }) async {
    var token = Publics.controller.getToken.value;
    final data = {
      "em": email,
      "pl": pw_lama,
      "pb": pw_baru,
    };
    var response = await Dio().post(
      _postUbahPassword,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = CheckUp.fromJson(datas);
    if (obj.msg == "Invalid token: Expired") {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<AksesPX> getAksesPx(
      {required String user, required String pass}) async {
    var token = await getToken();
    final data = {"us": user, "pw": pass};
    var response = await Dio().post(
      _getAksesPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token ?? '',
        },
      ),
      data: data,
    );
    final datas = jsonDecode(response.data);
    final obj = AksesPX.fromJson(datas);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(obj.code.toString(), obj.msg.toString(),
          backgroundColor: const Color(0xffe5f3e7));
    } else {
      if (obj.code != 200) {
        Get.back();
        Get.snackbar(obj.code.toString(), obj.msg.toString(),
            backgroundColor: const Color(0xffe5f3e7));
      } else {
        DataPasien dataPasien = await API.getDataPasien(noKtp: obj.res!.noKtp!);
        await LocalStorages.setDataRegist(DataRegist(
          email: user,
          password: pass,
          fotoPasien: obj.res!.fotoPasien,
          noKtp: obj.res!.noKtp,
          namaPasien: obj.res!.namaPasien,
          alamat: dataPasien.res![0].alamat,
          alergi: dataPasien.res![0].alergi,
          golonganDarah: dataPasien.res![0].golDarah,
          jenisKelamin: dataPasien.res![0].gender,
          tempatLahir: dataPasien.res![0].tmpLhr,
          noHp: dataPasien.res![0].noHp,
          tanggalLahir: dataPasien.res![0].tglLhr,
          umur: dataPasien.res![0].umur,
        ));
      }
    }
    print(obj.toJson());
    return obj;
  }
  //
  // static Future<DaftarPXBaru> scanantreanKlinik(
  //     {required String noKtp,
  //     required String idReqKlinik,
  //     required String kodeKlinik}) async {
  //   var token = Publics.controller.getToken.value;
  //   var data = {"kk": kodeKlinik, "nt": noKtp, "re": idReqKlinik};
  //   var response = await Dio().post(
  //     _scanantreanKlinik,
  //     options: Options(
  //       headers: {
  //         "Content-Type": "application/json",
  //         "X-Api-Token": token.token,
  //       },
  //     ),
  //     data: data,
  //   );
  //   final json = jsonDecode(response.data);
  //   final obj = DaftarPXBaru.fromJson(json);
  //   if (obj.msg == 'Invalid token: Expired') {
  //     Get.offAllNamed(Routes.LOGIN);
  //     Get.snackbar(
  //       obj.code.toString(),
  //       obj.msg.toString(),
  //     );
  //   }
  //   print(obj.toJson());
  //   return obj;
  // }

  static Future<DaftarPXBaru> scanAntrianKlinik(
      {required String noKtp,
      required String idReqKlinik,
      required String kodeKlinik}) async {
    var token = Publics.controller.getToken.value;
    var data = {"kk": kodeKlinik, "nt": noKtp, "re": idReqKlinik};
    var response = await Dio().post(
      _scanAntrianKlinik,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    print(obj.toJson());
    return obj;
  }

  static Future<dynamic> postDaftarPxBaru({
    required String namaPasien,
    required String email,
    required String noKtp,
    required String jenisKelamin,
    required String tanggalLahir,
    required String noHp,
    required String tmpLhr,
    required String umurPasien,
    required String alamat,
    required String alergi,
    required String golonganDarah,
    required String password,
  }) async {
    var token = await getToken();
    final data = {
      "np": namaPasien,
      "em": email,
      "nt": noKtp,
      "jk": jenisKelamin,
      "tl": tanggalLahir,
      "nh": noHp,
      "up": umurPasien,
      "tmpLhr": tmpLhr,
      "al": alamat,
      "alergi": alergi,
      "gd": golonganDarah,
      "password": password
    };
    var response = await Dio().post(
      _postDaftarPxBaru,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = jsonDecode(response.data);
    if (obj['msg'] == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj['code'].toString(),
        obj['msg'].toString(),
      );
    } else {
      if (obj['code'] != 200) {
        Get.snackbar(
          obj['code'].toString(),
          obj['msg'].toString(),
        );
      } else {
        await LocalStorages.setDataRegist(DataRegist(
          alamat: alamat,
          alergi: alergi,
          email: email,
          golonganDarah: golonganDarah,
          jenisKelamin: jenisKelamin,
          namaPasien: namaPasien,
          noHp: noHp,
          umur: umurPasien,
          tempatLahir: tmpLhr,
          noKtp: noKtp,
          password: password,
          tanggalLahir: tanggalLahir,
        ));
      }
    }
    return obj;
  }

  static Future<Poli> getPoli() async {
    var token = Publics.controller.getToken.value;
    var data = {"kk": _kodeKlinik};
    var response = await Dio().post(
      _getPoli,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = Poli.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<GetAllDokterKlinik> getAllDokterKlinik(
      {required String filter}) async {
    var data = {"filter": filter};
    final token = Publics.controller.getToken.value;
    var response = await Dio().post(
      _getAllDokterKlinik,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data!);
    final obj = GetAllDokterKlinik.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<GetDokterByName> getDokterByName(
      {required String namaDokter}) async {
    var token = Publics.controller.getToken.value;
    var data = {"kk": _kodeKlinik, "filter": namaDokter};
    var response = await Dio().post(
      _getDokterKlinik,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = GetDokterByName.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DaftarPXBaru> postDaftarPx(
      {required String namaPasien,
      required String jadwal,
      required String noAntrian,
      required String noKtp,
      required String kodeDokter,
      required String kodeBagian,
      required String namaBagian,
      required String namaKlinik,
      required String namaDokter,
      required String durasi,
      required String ketKlinik,
      required String tglDaftar}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "np": namaPasien,
      "jadwal": jadwal,
      "no_antrian": noAntrian,
      "nt": noKtp,
      "kd": kodeDokter,
      "kode_bagian": kodeBagian,
      "nama_bagian": namaBagian,
      "nama_klinik": namaKlinik,
      "nama_dokter": namaDokter,
      "dr": durasi,
      "ket_klinik": ketKlinik,
      "kk": _kodeKlinik,
      "td": tglDaftar
    };
    var response = await Dio().post(
      _postDaftarPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data!);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<AsuransiPx> getAsuransiPx() async {
    var token = Publics.controller.getToken.value;
    var data = {};
    var response = await Dio().post(
      _getAsuransiPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final value = jsonDecode(response.data);
    final obj = AsuransiPx.fromJson(value);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DokterHemo> getDokterHemo() async {
    var token = LocalStorages.getToken;
    var data = {};
    var response = await Dio().post(
      _getDokterHemo,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token ?? '',
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    print(json);
    final obj = DokterHemo.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(obj.code.toString(), obj.msg.toString(),
          backgroundColor: const Color(0xffe5f3e7));
    }
    return obj;
  }

  static Future<AntrianDokter> getAntrianDokter(
      {required String idJadwal,
      required String kodeDokter,
      required String tglDaftar}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "kk": _kodeKlinik,
      "src": {
        "id_jadwal": idJadwal,
        "kd": kodeDokter,
        "td": tglDaftar,
      }
    };
    var response = await Dio().post(
      _getAntrianDokter,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = AntrianDokter.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DaftarHemo> postDaftarHemo({
    required String namaPasien,
    required String noKtp,
    required String flagPesan,
    required String kodeDokter,
    required String namaDokter,
    required String tglDaftar,
    required String jenisPx,
    required String pxLama,
    required String kdAsuransi,
    required String kolom1,
    required String kolom2,
    required String jnsKunjBpjs,
  }) async {
    var token = LocalStorages.getToken;
    var data = {
      "nama_pasien": namaPasien,
      "no_ktp": noKtp,
      "flag_pesan": flagPesan,
      "kode_rs": _kodeKlinik,
      "kode_dokter": kodeDokter,
      "nama_dokter": namaDokter,
      "tgl_daftar": tglDaftar,
      "jenis_px": jenisPx,
      "px_lama": pxLama,
      "kd_asuransi": kdAsuransi,
      "kolom1": kolom1,
      "kolom2": kolom2,
      "jns_kunj_bpjs": jnsKunjBpjs,
    };
    var response = await Dio().post(
      _postDaftarHemo,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token ?? '',
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarHemo.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(obj.code.toString(), obj.msg.toString(),
          backgroundColor: const Color(0xffe5f3e7));
    }
    return obj;
  }

  static Future<JadwalPx> getJadwalPx(
      {required String noKtp, required String tgl}) async {
    var token = Publics.controller.getToken.value;
    var data = {"nt": noKtp, "tgl": tgl};
    var response = await Dio().post(
      _getJadwalPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = JadwalPx.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<JadwalHemo> getJadwalHemoPx(
      {required String noKtp, required String tgl}) async {
    var token = Publics.controller.getToken.value;
    var data = {"nt": noKtp, "tgl": tgl};
    var response = await Dio().post(
      _getJadwalHemoPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = JadwalHemo.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<JadwalPxDetail> getJadwalPxDetail(
      {required String idReq}) async {
    var token = Publics.controller.getToken.value;
    var data = {"kk": _kodeKlinik, "ir": idReq};
    var response = await Dio().post(
      _getJadwalPxDetail,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = JadwalPxDetail.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DaftarPXBaru> getJadwalHemoDetail(
      {required String idReq}) async {
    var token = Publics.controller.getToken.value;
    var data = {"ir": idReq};
    var response = await Dio().post(
      _getJadwalHemoDetail,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  // static Future<DaftarPXBaru> scanAntrianKlinik(
  //     {required String noKtp,
  //     required String idReqKlinik,
  //     required String kodeKlinik}) async {
  //   var token = Publics.controller.getToken.value;
  //   var data = {
  //     "kk": kodeKlinik,
  //     "nt": noKtp,
  //     "re": idReqKlinik
  //   };
  //   var response = await Dio().post(
  //     _scanAntrianKlinik,
  //     options: Options(
  //       headers: {
  //         "Content-Type": "application/json",
  //         "X-Api-Token": token.token,
  //       },
  //     ),
  //     data: data,
  //   );
  //   final json = jsonDecode(response.data);
  //   final obj = DaftarPXBaru.fromJson(json);
  //   if (obj.msg == 'Invalid token: Expired') {
  //     Get.offAllNamed(Routes.LOGIN);
  //     Get.snackbar(
  //       obj.code.toString(),
  //       obj.msg.toString(),
  //     );
  //   }
  //   return obj;
  // }

  static Future<DataPasien> getDataPasien({required String noKtp}) async {
    var token = Publics.controller.getToken.value;
    var data = {"nt": noKtp};
    var response = await Dio().post(
      _getDataPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = DataPasien.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      await LocalStorages.setDataRegist(DataRegist(
        alamat: obj.res!.first.alamat,
        alergi: obj.res!.first.alergi,
        golonganDarah: obj.res!.first.golDarah,
        jenisKelamin: obj.res!.first.gender,
        noHp: obj.res!.first.noHp,
        email: obj.res!.first.email,
        namaPasien: obj.res!.first.namaPasien,
        tanggalLahir: obj.res!.first.tglLhr,
        umur: obj.res!.first.umur,
        tempatLahir: obj.res!.first.tmpLhr,
      ));
    }
    return obj;
  }

  static Future<DataPx> getDataPx({required String noKtp}) async {
    var token = Publics.controller.getToken.value;
    var data = {"nt": noKtp};
    var response = await Dio().post(
      _getDataPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DataPx.fromJson(json);
    return obj;
  }

  static Future<DataPx> cekDataPx({required String noKtp}) async {
    var token = Publics.controller.getToken.value;
    var data = {"nt": noKtp};
    var response = await Dio().post(
      _cekDataPx,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DataPx.fromJson(json);
    return obj;
  }

  static Future<DaftarPXBaru> editPasienLama(
      {required String noKtp,
      required String namaPasien,
      required String umurPasien,
      required String tempatLahir,
      required String tanggalLahir,
      required String gender,
      required String noHP,
      required String golDarah,
      required String alergi,
      required String email,
      required String alamat}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "em": email,
      "nt": noKtp,
      "namaPasien": namaPasien,
      "up": umurPasien,
      "goldarah": golDarah,
      "nh": noHP,
      "tanggal_lhr": tanggalLahir,
      "tempat_lhr": tempatLahir,
      "gender": gender,
      "alergi": alergi,
      "al": alamat
    };
    var response = await Dio().post(
      _editPasienLama,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DaftarPXBaru> editFotoPasien(
      {required String noKtp, required String fotoProfile}) async {
    var token = Publics.controller.getToken.value;
    var data = {"nt": noKtp, "fotoProfile": fotoProfile};
    var response = await Dio().post(
      _editFotoPasien,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DaftarPXBaru> editFotoKtp(
      {required String noKtp, required String fotoKtp}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "nt": noKtp,
      "fotoktp": fotoKtp //((Base64 String Foto))
    };
    var response = await Dio().post(
      _editFotoKtp,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<ListMRPX> getListMr(
      {required String noKtp, required String tgl}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "kk": _kodeKlinik,
      "ktp": noKtp,
      "url_rs": _url,
      "tgl_mr": tgl,
    };
    var response = await Dio().post(
      _getListMr,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = ListMRPX.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      }
    }
    return obj;
  }

  static Future<DetailRiwayat> getDetailRiwayat({required String id}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "kk": _kodeKlinik,
      "id": id,
      "url_rs": _url,
    };
    var response = await Dio().post(
      _getDetailHistory,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final obj = DetailRiwayat.fromJson(jsonDecode(response.data));
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      }
    }
    return obj;
  }

  static Future<DaftarPXBaru> getFotoRad(
      {required String kdPenunjang, required String kodeTarif}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "kk": _kodeKlinik,
      "param": {"kd_penunjang": kdPenunjang, "kode_tarif": kodeTarif}
    };
    var response = await Dio().post(
      _getFotoRad,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DaftarPXBaru> getCetakResep(
      {required String noMr,
      required String noRegister,
      required String noKunjungan,
      required String kodePesanResepDr}) async {
    var token = Publics.controller.getToken.value;
    var data = {
      "kk": _kodeKlinik,
      "nm": noMr,
      "nr": noRegister,
      "nk": noKunjungan,
      "kode_pesan_resep_dr": kodePesanResepDr
    };
    var response = await Dio().post(
      _getCetakResep,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
      data: data,
    );
    final json = jsonDecode(response.data);
    final obj = DaftarPXBaru.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    }
    return obj;
  }

  static Future<DetailKlinik> getDetailKlinik() async {
    var token = Publics.controller.getToken.value;
    var response = await Dio().post(
      _getKlinikDetail,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Token": token.token,
        },
      ),
    );
    final json = jsonDecode(response.data);
    final obj = DetailKlinik.fromJson(json);
    if (obj.msg == 'Invalid token: Expired') {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        obj.code.toString(),
        obj.msg.toString(),
      );
    } else {
      if (obj.code != 200) {
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar(
          obj.code.toString(),
          obj.msg.toString(),
        );
      }
    }
    return obj;
  }
}
