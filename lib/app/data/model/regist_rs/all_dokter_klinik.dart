class GetAllDokterKlinik {
  String? count;
  int? code;
  String? msg;
  List<Items>? items;

  GetAllDokterKlinik({this.count, this.code, this.msg, this.items});

  GetAllDokterKlinik.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    code = json['code'];
    msg = json['msg'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['code'] = code;
    data['msg'] = msg;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? kodeDokter;
  String? noInduk;
  String? namaPegawai;
  String? kodeBagian;
  String? namaBagian;
  String? foto;
  String? msgDokter;
  int? no;
  List<Jadwal>? jadwal;

  Items(
      {this.kodeDokter,
      this.noInduk,
      this.namaPegawai,
      this.kodeBagian,
      this.namaBagian,
      this.foto,
      this.no,
      this.msgDokter,
      this.jadwal});

  Items.fromJson(Map<String, dynamic> json) {
    kodeDokter = json['kode_dokter'];
    noInduk = json['no_induk'];
    namaPegawai = json['nama_pegawai'];
    kodeBagian = json['kode_bagian'];
    namaBagian = json['nama_bagian'];
    foto = json['foto'];
    msgDokter = json['msg_dokter'];
    no = json['no'];
    if (json['jadwal'] != null) {
      jadwal = <Jadwal>[];
      json['jadwal'].forEach((v) {
        jadwal!.add(Jadwal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_dokter'] = kodeDokter;
    data['no_induk'] = noInduk;
    data['nama_pegawai'] = namaPegawai;
    data['kode_bagian'] = kodeBagian;
    data['nama_bagian'] = namaBagian;
    data['foto'] = foto;
    data['msg_dokter'] = msgDokter;
    data['no'] = no;
    if (jadwal != null) {
      data['jadwal'] = jadwal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jadwal {
  String? id;
  String? rangeHari;
  String? jamMulai;
  String? jamAkhir;
  String? waktuPeriksa;

  Jadwal(
      {this.id,
      this.rangeHari,
      this.jamMulai,
      this.jamAkhir,
      this.waktuPeriksa});

  Jadwal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rangeHari = json['range_hari'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    waktuPeriksa = json['waktu_periksa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['range_hari'] = rangeHari;
    data['jam_mulai'] = jamMulai;
    data['jam_akhir'] = jamAkhir;
    data['waktu_periksa'] = waktuPeriksa;
    return data;
  }
}
