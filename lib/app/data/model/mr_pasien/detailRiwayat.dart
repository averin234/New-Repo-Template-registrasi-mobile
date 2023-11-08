class DetailRiwayat {
  List<Px>? px;
  List<VitalSign>? vitalSign;
  List<Tindakan>? tindakan;
  dynamic icd10;
  List<Resep>? resep;
  dynamic hasilLab;
  dynamic hasilRad;
  int? code;
  String? msg;

  DetailRiwayat(
      {this.px,
      this.vitalSign,
      this.tindakan,
      this.icd10,
      this.resep,
      this.hasilLab,
      this.hasilRad,
      this.msg,
      this.code});

  DetailRiwayat.fromJson(Map<String, dynamic> json) {
    if (json['px'] != null) {
      px = <Px>[];
      json['px'].forEach((v) {
        px!.add(Px.fromJson(v));
      });
    }
    if (json['vital_sign'] != null) {
      vitalSign = <VitalSign>[];
      json['vital_sign'].forEach((v) {
        vitalSign!.add(VitalSign.fromJson(v));
      });
    }
    if (json['tindakan'] != null) {
      tindakan = <Tindakan>[];
      json['tindakan'].forEach((v) {
        tindakan!.add(Tindakan.fromJson(v));
      });
    }
    icd10 = json['icd10'];
    if (json['resep'] != null) {
      resep = <Resep>[];
      json['resep'].forEach((v) {
        resep!.add(Resep.fromJson(v));
      });
    }
    hasilLab = json['hasil_lab'];
    hasilRad = json['hasil_rad'];
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (px != null) {
      data['px'] = px!.map((v) => v.toJson()).toList();
    }
    if (vitalSign != null) {
      data['vital_sign'] = vitalSign!.map((v) => v.toJson()).toList();
    }
    if (tindakan != null) {
      data['tindakan'] = tindakan!.map((v) => v.toJson()).toList();
    }
    data['icd10'] = icd10;
    if (resep != null) {
      data['resep'] = resep!.map((v) => v.toJson()).toList();
    }
    data['hasil_lab'] = hasilLab;
    data['hasil_rad'] = hasilRad;
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}

class Px {
  String? namaPx;
  String? nomrPx;
  String? ktpPx;
  String? gender;
  String? golDarah;
  String? umur;
  String? alergi;
  String? alamatPx;

  Px(
      {this.namaPx,
      this.nomrPx,
      this.ktpPx,
      this.gender,
      this.golDarah,
      this.umur,
      this.alergi,
      this.alamatPx});

  Px.fromJson(Map<String, dynamic> json) {
    namaPx = json['nama_px'];
    nomrPx = json['nomr_px'];
    ktpPx = json['ktp_px'];
    gender = json['gender'];
    golDarah = json['gol_darah'];
    umur = json['umur'];
    alergi = json['alergi'];
    alamatPx = json['alamat_px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_px'] = namaPx;
    data['nomr_px'] = nomrPx;
    data['ktp_px'] = ktpPx;
    data['gender'] = gender;
    data['gol_darah'] = golDarah;
    data['umur'] = umur;
    data['alergi'] = alergi;
    data['alamat_px'] = alamatPx;
    return data;
  }
}

class VitalSign {
  String? kodeRujukRi;
  String? tinggiBadan;
  String? lingkarPerut;
  String? beratBadan;
  String? pernafasan;
  String? suhu;
  String? nadi;
  String? tekananDarah;
  String? kesadaranPasien;
  String? keadaanUmum;
  String? noRegistrasi;

  VitalSign(
      {this.kodeRujukRi,
      this.tinggiBadan,
      this.lingkarPerut,
      this.beratBadan,
      this.pernafasan,
      this.suhu,
      this.nadi,
      this.tekananDarah,
      this.kesadaranPasien,
      this.keadaanUmum,
      this.noRegistrasi});

  VitalSign.fromJson(Map<String, dynamic> json) {
    kodeRujukRi = json['kode_rujuk_ri'];
    tinggiBadan = json['tinggi_badan'];
    lingkarPerut = json['lingkar_perut'];
    beratBadan = json['berat_badan'];
    pernafasan = json['pernafasan'];
    suhu = json['suhu'];
    nadi = json['nadi'];
    tekananDarah = json['tekanan_darah'];
    kesadaranPasien = json['kesadaran_pasien'];
    keadaanUmum = json['keadaan_umum'];
    noRegistrasi = json['no_registrasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_rujuk_ri'] = kodeRujukRi;
    data['tinggi_badan'] = tinggiBadan;
    data['lingkar_perut'] = lingkarPerut;
    data['berat_badan'] = beratBadan;
    data['pernafasan'] = pernafasan;
    data['suhu'] = suhu;
    data['nadi'] = nadi;
    data['tekanan_darah'] = tekananDarah;
    data['kesadaran_pasien'] = kesadaranPasien;
    data['keadaan_umum'] = keadaanUmum;
    data['no_registrasi'] = noRegistrasi;
    return data;
  }
}

class Tindakan {
  int? noTdk;
  String? namaTindakan;

  Tindakan({this.noTdk, this.namaTindakan});

  Tindakan.fromJson(Map<String, dynamic> json) {
    noTdk = json['no_tdk'];
    namaTindakan = json['nama_tindakan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_tdk'] = noTdk;
    data['nama_tindakan'] = namaTindakan;
    return data;
  }
}

class Resep {
  String? kodePesan;
  String? noResep;
  String? namaBrg;
  String? note;
  String? satuan;
  String? namaDosis;
  String? jumlahPesan;
  String? ket;
  int? no;

  Resep(
      {this.kodePesan,
      this.noResep,
      this.namaBrg,
      this.note,
      this.satuan,
      this.namaDosis,
      this.jumlahPesan,
      this.ket,
      this.no});

  Resep.fromJson(Map<String, dynamic> json) {
    kodePesan = json['kode_pesan'];
    noResep = json['no_resep'];
    namaBrg = json['nama_brg'];
    note = json['note'];
    satuan = json['satuan'];
    namaDosis = json['nama_dosis'];
    jumlahPesan = json['jumlah_pesan'];
    ket = json['ket'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_pesan'] = kodePesan;
    data['no_resep'] = noResep;
    data['nama_brg'] = namaBrg;
    data['note'] = note;
    data['satuan'] = satuan;
    data['nama_dosis'] = namaDosis;
    data['jumlah_pesan'] = jumlahPesan;
    data['ket'] = ket;
    data['no'] = no;
    return data;
  }
}
