class JadwalPxDetail {
  int? code;
  String? msg;
  List<Lists>? list;

  JadwalPxDetail({this.code, this.list, this.msg});

  JadwalPxDetail.fromJson(Map<String, dynamic> json) {
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
  String? idReg;
  String? noAntrian;
  String? namaDokter;
  String? tgl;
  String? jamAwal;
  String? jamAkhir;
  String? status;
  String? namaKlinik;
  String? namaBagian;
  String? ketKlinik;
  String? statJam;

  Lists(
      {this.idReg,
      this.noAntrian,
      this.namaDokter,
      this.tgl,
      this.jamAwal,
      this.jamAkhir,
      this.status,
      this.namaKlinik,
      this.namaBagian,
      this.ketKlinik,
      this.statJam});

  Lists.fromJson(Map<String, dynamic> json) {
    idReg = json['idReg'];
    noAntrian = json['no_antrian'];
    namaDokter = json['nama_dokter'];
    tgl = json['tgl'];
    jamAwal = json['jam_awal'];
    jamAkhir = json['jam_akhir'];
    status = json['status'];
    namaKlinik = json['nama_klinik'];
    namaBagian = json['nama_bagian'];
    ketKlinik = json['ket_klinik'];
    statJam = json['stat_jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idReg'] = idReg;
    data['no_antrian'] = noAntrian;
    data['nama_dokter'] = namaDokter;
    data['tgl'] = tgl;
    data['jam_awal'] = jamAwal;
    data['jam_akhir'] = jamAkhir;
    data['status'] = status;
    data['nama_klinik'] = namaKlinik;
    data['nama_bagian'] = namaBagian;
    data['ket_klinik'] = ketKlinik;
    data['stat_jam'] = statJam;
    return data;
  }
}
