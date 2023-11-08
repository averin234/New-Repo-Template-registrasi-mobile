class ListMRPX {
  List<Px>? px;
  List<Res>? res;
  int? code;
  String? msg;

  ListMRPX({this.px, this.res, this.code, this.msg});

  ListMRPX.fromJson(Map<String, dynamic> json) {
    if (json['px'] != null) {
      px = <Px>[];
      json['px'].forEach((v) {
        px!.add(Px.fromJson(v));
      });
    }
    if (json['res'] != null) {
      res = <Res>[];
      json['res'].forEach((v) {
        res!.add(Res.fromJson(v));
      });
    }
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (px != null) {
      data['px'] = px!.map((v) => v.toJson()).toList();
    }
    if (res != null) {
      data['res'] = res!.map((v) => v.toJson()).toList();
    }
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

  Px(
      {this.namaPx,
      this.nomrPx,
      this.ktpPx,
      this.gender,
      this.golDarah,
      this.umur});

  Px.fromJson(Map<String, dynamic> json) {
    namaPx = json['nama_px'];
    nomrPx = json['nomr_px'];
    ktpPx = json['ktp_px'];
    gender = json['gender'];
    golDarah = json['gol_darah'];
    umur = json['umur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_px'] = namaPx;
    data['nomr_px'] = nomrPx;
    data['ktp_px'] = ktpPx;
    data['gender'] = gender;
    data['gol_darah'] = golDarah;
    data['umur'] = umur;
    return data;
  }
}

class Res {
  String? wktPeriksa;
  int? statRegist;
  int? noUrut;
  String? noMr;
  String? idReg;
  String? noKunjungan;
  String? kodeBagAsal;
  String? tglPeriksa;
  String? namaBagian;
  String? namaDokter;
  String? urlRs;

  Res(
      {this.wktPeriksa,
      this.statRegist,
      this.noUrut,
      this.noMr,
      this.idReg,
      this.noKunjungan,
      this.kodeBagAsal,
      this.tglPeriksa,
      this.namaBagian,
      this.namaDokter,
      this.urlRs});

  Res.fromJson(Map<String, dynamic> json) {
    wktPeriksa = json['wkt_periksa'];
    statRegist = json['stat_regist'];
    noUrut = json['no_urut'];
    noMr = json['no_mr'];
    idReg = json['idReg'];
    noKunjungan = json['no_kunjungan'];
    kodeBagAsal = json['kode_bag_asal'];
    tglPeriksa = json['tgl_periksa'];
    namaBagian = json['nama_bagian'];
    namaDokter = json['nama_dokter'];
    urlRs = json['url_rs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wkt_periksa'] = wktPeriksa;
    data['stat_regist'] = statRegist;
    data['no_urut'] = noUrut;
    data['no_mr'] = noMr;
    data['idReg'] = idReg;
    data['no_kunjungan'] = noKunjungan;
    data['kode_bag_asal'] = kodeBagAsal;
    data['tgl_periksa'] = tglPeriksa;
    data['nama_bagian'] = namaBagian;
    data['nama_dokter'] = namaDokter;
    data['url_rs'] = urlRs;
    return data;
  }
}
