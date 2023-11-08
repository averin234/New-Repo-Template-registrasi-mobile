class DataPx {
  int? code;
  String? msg;

  DataPx({this.code, this.msg});

  DataPx.fromJson(Map<String, dynamic> json) {
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
