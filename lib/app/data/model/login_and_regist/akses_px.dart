class AksesPX {
  int? code;
  Res? res;
  String? msg;

  AksesPX({this.code, this.res});

  AksesPX.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    res = json['res'] != null ? Res.fromJson(json['res']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (res != null) {
      data['res'] = res!.toJson();
    }
    return data;
  }
}

class Res {
  String? namaPasien;
  String? noKtp;
  String? fotoPasien;

  Res({this.namaPasien, this.noKtp, this.fotoPasien});

  Res.fromJson(Map<String, dynamic> json) {
    namaPasien = json['nama_pasien'];
    noKtp = json['no_ktp'];
    fotoPasien = json['foto_pasien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_pasien'] = namaPasien;
    data['no_ktp'] = noKtp;
    data['foto_pasien'] = fotoPasien;
    return data;
  }
}
