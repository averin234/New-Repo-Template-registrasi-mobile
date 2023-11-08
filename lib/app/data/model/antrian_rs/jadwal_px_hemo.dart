class JadwalHemo {
  List<ListHemo>? list;
  int? code;
  String? msg;

  JadwalHemo({this.list, this.code});

  JadwalHemo.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListHemo>[];
      json['list'].forEach((v) {
        list!.add(ListHemo.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    return data;
  }
}

class ListHemo {
  String? idReg;
  String? namaDokter;
  String? namaBagian;
  String? tgl;
  dynamic status;
  dynamic kodeRs;
  dynamic ketRs;
  String? wktPesan;

  ListHemo(
      {this.idReg,
        this.namaDokter,
        this.namaBagian,
        this.tgl,
        this.status,
        this.kodeRs,
        this.ketRs,
        this.wktPesan});

  ListHemo.fromJson(Map<String, dynamic> json) {
    idReg = json['idReg'];
    namaDokter = json['nama_dokter'];
    namaBagian = json['nama_bagian'];
    tgl = json['tgl'];
    status = json['status'];
    kodeRs = json['kode_rs'];
    ketRs = json['ket_rs'];
    wktPesan = json['wkt_pesan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idReg'] = idReg;
    data['nama_dokter'] = namaDokter;
    data['nama_bagian'] = namaBagian;
    data['tgl'] = tgl;
    data['status'] = status;
    data['kode_rs'] = kodeRs;
    data['ket_rs'] = ketRs;
    data['wkt_pesan'] = wktPesan;
    return data;
  }
}
