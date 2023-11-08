class AntrianDokter {
  List<Lists>? list;
  int? code;
  String? msg;

  AntrianDokter({this.list, this.code, this.msg});

  AntrianDokter.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(Lists.fromJson(v));
      });
    }
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}

class Lists {
  int? antrian;
  String? durasi;
  String? jam;

  Lists({this.antrian, this.durasi, this.jam});

  Lists.fromJson(Map<String, dynamic> json) {
    antrian = json['antrian'];
    durasi = json['durasi'];
    jam = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['antrian'] = antrian;
    data['durasi'] = durasi;
    data['jam'] = jam;
    return data;
  }
}
