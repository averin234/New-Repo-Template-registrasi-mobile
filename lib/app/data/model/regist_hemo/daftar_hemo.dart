class DaftarHemo {
  int? code;
  int? idReg;
  String? tgl;
  String? msg;

  DaftarHemo({this.code, this.idReg, this.tgl, this.msg});

  DaftarHemo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    idReg = json['idReg'];
    tgl = json['tgl'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['idReg'] = idReg;
    data['tgl'] = tgl;
    data['msg'] = msg;
    return data;
  }
}
