class DokterHemo {
  int? code;
  String? msg;
  List<Lists>? list;

  DokterHemo({this.code, this.list, this.msg});

  DokterHemo.fromJson(Map<String, dynamic> json) {
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
  String? kodeDokter;
  String? namaDokter;

  Lists({this.kodeDokter, this.namaDokter});

  Lists.fromJson(Map<String, dynamic> json) {
    kodeDokter = json['kode_dokter'];
    namaDokter = json['nama_dokter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_dokter'] = kodeDokter;
    data['nama_dokter'] = namaDokter;
    return data;
  }
}
