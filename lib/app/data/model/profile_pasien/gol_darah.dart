class DataPx {
  int? code;
  List<String>? list;

  DataPx({this.code, this.list});

  DataPx.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['list'] = list;
    return data;
  }
}
