class Poli {
  int? code;
  String? msg;
  List<Lists>? list;

  Poli({this.code, this.list});

  Poli.fromJson(Map<String, dynamic> json) {
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
  String? kodeBagian;
  String? namaBagian;

  Lists({this.kodeBagian, this.namaBagian});

  Lists.fromJson(Map<String, dynamic> json) {
    kodeBagian = json['kode_bagian'];
    namaBagian = json['nama_bagian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_bagian'] = kodeBagian;
    data['nama_bagian'] = namaBagian;
    return data;
  }
}
