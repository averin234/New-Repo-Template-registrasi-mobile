class GetDokterByName {
  List<Items>? items;
  int? code;
  String? msg;

  GetDokterByName({this.items, this.code});

  GetDokterByName.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}

class Items {
  String? kodeDokter;
  String? id;
  String? namaPegawai;
  String? jamMulai;
  String? jamAkhir;
  String? namaBagian;
  String? rangeHari;
  String? urlFotoKaryawan;
  String? noInduk;
  String? waktuPeriksa;
  String? kodeBagian;
  String? foto;
  int? no;

  Items(
      {this.kodeDokter,
      this.id,
      this.namaPegawai,
      this.jamMulai,
      this.jamAkhir,
      this.namaBagian,
      this.rangeHari,
      this.urlFotoKaryawan,
      this.noInduk,
      this.waktuPeriksa,
      this.kodeBagian,
      this.foto,
      this.no});

  Items.fromJson(Map<String, dynamic> json) {
    kodeDokter = json['kode_dokter'];
    id = json['id'];
    namaPegawai = json['nama_pegawai'];
    jamMulai = json['jam_mulai'];
    jamAkhir = json['jam_akhir'];
    namaBagian = json['nama_bagian'];
    rangeHari = json['range_hari'];
    urlFotoKaryawan = json['url_foto_karyawan'];
    noInduk = json['no_induk'];
    waktuPeriksa = json['waktu_periksa'];
    kodeBagian = json['kode_bagian'];
    foto = json['foto'];
    no = json['no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_dokter'] = kodeDokter;
    data['id'] = id;
    data['nama_pegawai'] = namaPegawai;
    data['jam_mulai'] = jamMulai;
    data['jam_akhir'] = jamAkhir;
    data['nama_bagian'] = namaBagian;
    data['range_hari'] = rangeHari;
    data['url_foto_karyawan'] = urlFotoKaryawan;
    data['no_induk'] = noInduk;
    data['waktu_periksa'] = waktuPeriksa;
    data['kode_bagian'] = kodeBagian;
    data['foto'] = foto;
    data['no'] = no;
    return data;
  }
}
