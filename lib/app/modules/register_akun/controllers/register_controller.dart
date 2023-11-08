import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/model/dropdown_model.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
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
  final usiaController = TextEditingController();
  final passwordController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final isObscurePass = true.obs;
  final isObscureConfirmPass = true.obs;

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
