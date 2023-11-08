class AsuransiPx {
  int? code;
  String? msg;
  List<Lists>? list;

  AsuransiPx({this.code, this.list});

  AsuransiPx.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String? kodePerusahaan;
  String? namaPerusahaan;

  Lists({this.kodePerusahaan, this.namaPerusahaan});

  Lists.fromJson(Map<String, dynamic> json) {
    kodePerusahaan = json['kode_perusahaan'];
    namaPerusahaan = json['nama_perusahaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_perusahaan'] = kodePerusahaan;
    data['nama_perusahaan'] = namaPerusahaan;
    return data;
  }
}
