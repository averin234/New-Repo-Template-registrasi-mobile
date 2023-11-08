class DaftarPXBaru {
  int? code;
  String? msg;

  DaftarPXBaru({this.code, this.msg});

  DaftarPXBaru.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}
