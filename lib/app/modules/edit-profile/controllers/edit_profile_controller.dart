import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rskgcare/app/data/componen/publics.dart';

import '../../../data/model/dropdown_model.dart';

class EditProfileController extends GetxController {
  //TODO: Implement RegisterController
  final dataPasien = Publics.controller.getDataRegist;
  final nikPasienController = TextEditingController();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final noTelpController = TextEditingController();
  final tglLhrController = TextEditingController();
  final tempatLhrController = TextEditingController();
  final alamatController = TextEditingController();
  final jenisKelaminController = TextEditingController();
  final alergiController = TextEditingController();
  final golDarahController = TextEditingController();
  final fotoController = TextEditingController();
  final passwordController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final isObscurePass = true.obs;
  final isObscureConfirmPass = true.obs;
  final fileImage = ''.obs;
  Dropdowns selectedItemGender = Dropdowns(kategori: '', initialValue: '');
  Dropdowns selectedItemGolDar = Dropdowns(kategori: '', initialValue: '');
  final gender = [
    Dropdowns(kategori: 'Pria', initialValue: 'L'),
    Dropdowns(kategori: 'Wanita', initialValue: 'P')
  ];
  final golDar = [
    Dropdowns(kategori: 'A', initialValue: 'A'),
    Dropdowns(kategori: 'B', initialValue: 'B'),
    Dropdowns(kategori: 'AB', initialValue: 'AB'),
    Dropdowns(kategori: 'O', initialValue: 'O'),
    Dropdowns(kategori: 'Belum Diperiksa', initialValue: 'Belum Diperiksa'),
  ];

  @override
  void onInit() {
    selectedItemGender = gender.firstWhere(
        (element) => element.initialValue == dataPasien.value.jenisKelamin);
    selectedItemGolDar = dataPasien.value.golonganDarah != null
        ? golDar.firstWhere((element) =>
            element.initialValue == dataPasien.value.golonganDarah ||
            element.initialValue ==
                dataPasien.value.golonganDarah!
                    .substring(0, dataPasien.value.golonganDarah!.length - 1))
        : golDar.last;
    jenisKelaminController.text = selectedItemGender.initialValue;
    nikPasienController.text = dataPasien.value.noKtp ?? '';
    alamatController.text = dataPasien.value.alamat ?? '';
    alergiController.text = dataPasien.value.alergi ?? '';
    emailController.text = dataPasien.value.email ?? '';
    jenisKelaminController.text = dataPasien.value.jenisKelamin ?? '';
    golDarahController.text = dataPasien.value.golonganDarah ?? '';
    namaController.text = dataPasien.value.namaPasien ?? '';
    noTelpController.text = dataPasien.value.noHp ?? '';
    tglLhrController.text = DateFormat('yyyy-MM-dd').format(
        dataPasien.value.tanggalLahir != null
            ? DateTime.parse(dataPasien.value.tanggalLahir!)
            : DateTime.now());
    tempatLhrController.text = dataPasien.value.tempatLahir ?? '';
    super.onInit();
  }

  int umur(String tanggalLahir) {
    // Mendapatkan tanggal saat ini
    DateTime tanggalSekarang = DateTime.now();

    // Mengonversi tanggal lahir menjadi objek DateTime
    DateTime tanggalLahirObjek = DateTime.parse(tanggalLahir);

    // Menghitung selisih tahun antara tanggal lahir dan tanggal saat ini
    int selisihTahun = tanggalSekarang.year - tanggalLahirObjek.year;

    // Memeriksa apakah tanggal lahir sudah lewat hari ulang tahun di tahun ini
    if (tanggalSekarang.month < tanggalLahirObjek.month ||
        (tanggalSekarang.month == tanggalLahirObjek.month &&
            tanggalSekarang.day < tanggalLahirObjek.day)) {
      selisihTahun--;
    }
    return selisihTahun;
  }
}
