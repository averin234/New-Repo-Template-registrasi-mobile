class Token {
  int? code;
  String? token;

  Token({this.code, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['token'] = token;
    return data;
  }
}
