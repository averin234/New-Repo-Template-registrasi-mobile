class DataRegist {
  String? namaPasien;
  String? email;
  String? noKtp;
  String? fotoPasien;
  String? jenisKelamin;
  String? tanggalLahir;
  String? tempatLahir;
  String? noHp;
  String? alamat;
  String? umur;
  String? alergi;
  String? golonganDarah;
  String? password;
  bool? ingatSaya;

  DataRegist({
    this.namaPasien,
    this.email,
    this.noKtp,
    this.jenisKelamin,
    this.tanggalLahir,
    this.tempatLahir,
    this.noHp,
    this.fotoPasien,
    this.alamat,
    this.alergi,
    this.golonganDarah,
    this.password,
    this.ingatSaya,
    this.umur,
  });

  DataRegist.fromJson(Map<String, dynamic> json) {
    namaPasien = json['nama_pasien'];
    email = json['email'];
    noKtp = json['no_ktp'];
    fotoPasien = json['foto_pasien'] ?? 'null';
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    tempatLahir = json['tmp_lhr'];
    noHp = json['no_hp'];
    alamat = json['alamat'];
    alergi = json['alergi'];
    golonganDarah = json['golongan_darah'];
    password = json['password'];
    umur = json['umur'];
    ingatSaya = json['ingatSaya'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_pasien'] = namaPasien;
    data['email'] = email;
    data['no_ktp'] = noKtp;
    data['foto_pasien'] = fotoPasien;
    data['jenis_kelamin'] = jenisKelamin;
    data['tanggal_lahir'] = tanggalLahir;
    data['tmp_lhr'] = tempatLahir;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    data['alergi'] = alergi;
    data['golongan_darah'] = golonganDarah;
    data['password'] = password;
    data['ingatSaya'] = ingatSaya;
    data['umur'] = umur;
    return data;
  }
}
