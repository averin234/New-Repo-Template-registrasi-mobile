class DetailKlinik {
  int? code;
  String? msg;
  List<Res>? res;

  DetailKlinik({this.code, this.res});

  DetailKlinik.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['res'] != null) {
      res = <Res>[];
      json['res'].forEach((v) {
        res!.add(Res.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (res != null) {
      data['res'] = res!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Res {
  String? namaPerusahaan;
  String? alamat;
  String? email;

  Res({this.namaPerusahaan, this.alamat, this.email});

  Res.fromJson(Map<String, dynamic> json) {
    namaPerusahaan = json['nama_perusahaan'];
    alamat = json['alamat'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_perusahaan'] = namaPerusahaan;
    data['alamat'] = alamat;
    data['email'] = email;
    return data;
  }
}
