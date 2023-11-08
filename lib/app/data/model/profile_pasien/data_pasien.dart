class DataPasien {
  List<Res>? res;
  int? code;
  String? msg;

  DataPasien({this.res, this.code});

  DataPasien.fromJson(Map<String, dynamic> json) {
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
    if (res != null) {
      data['res'] = res!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}

class Res {
  String? mrPasien;
  String? ktpPasien;
  String? namaPasien;
  String? umur;
  String? alergi;
  String? alamat;
  String? golDarah;
  String? tglLhr;
  String? tmpLhr;
  String? gender;
  String? noHp;
  String? email;
  String? username;
  String? fotoPasien;
  String? fotoKtp;

  Res(
      {this.mrPasien,
      this.ktpPasien,
      this.namaPasien,
      this.umur,
      this.alergi,
      this.alamat,
      this.golDarah,
      this.tglLhr,
      this.tmpLhr,
      this.gender,
      this.noHp,
      this.email,
      this.username,
      this.fotoPasien,
      this.fotoKtp});

  Res.fromJson(Map<String, dynamic> json) {
    mrPasien = json['mr_pasien'];
    ktpPasien = json['ktp_pasien'];
    namaPasien = json['nama_pasien'];
    umur = json['umur'];
    alergi = json['alergi'];
    alamat = json['alamat'];
    golDarah = json['gol_darah'];
    tglLhr = json['tgl_lhr'];
    tmpLhr = json['tmp_lhr'];
    gender = json['gender'];
    noHp = json['no_hp'];
    email = json['email'];
    username = json['username'];
    fotoPasien = json['foto_pasien'];
    fotoKtp = json['foto_ktp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mr_pasien'] = mrPasien;
    data['ktp_pasien'] = ktpPasien;
    data['nama_pasien'] = namaPasien;
    data['umur'] = umur;
    data['alergi'] = alergi;
    data['alamat'] = alamat;
    data['gol_darah'] = golDarah;
    data['tgl_lhr'] = tglLhr;
    data['tmp_lhr'] = tmpLhr;
    data['gender'] = gender;
    data['no_hp'] = noHp;
    data['email'] = email;
    data['username'] = username;
    data['foto_pasien'] = fotoPasien;
    data['foto_ktp'] = fotoKtp;
    return data;
  }
}
