class DaftarPx {
  int? code;
  int? idReg;
  String? tgl;
  String? jamAwal;
  String? jamAkhir;
  String? msg;

  DaftarPx(
      {this.code, this.idReg, this.tgl, this.jamAwal, this.jamAkhir, this.msg});

  DaftarPx.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    idReg = json['idReg'];
    tgl = json['tgl'];
    jamAwal = json['jam_awal'];
    jamAkhir = json['jam_akhir'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['idReg'] = idReg;
    data['tgl'] = tgl;
    data['jam_awal'] = jamAwal;
    data['jam_akhir'] = jamAkhir;
    data['msg'] = msg;
    return data;
  }
}
