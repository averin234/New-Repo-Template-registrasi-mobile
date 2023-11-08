import 'package:get_storage/get_storage.dart';
import 'package:rskgcare/app/data/componen/data_regist_model.dart';
import 'package:rskgcare/app/data/componen/publics.dart';
import 'package:rskgcare/app/data/model/login_and_regist/token.dart';

class LocalStorages {
  static GetStorage boxToken = GetStorage('token_rsbk');
  static GetStorage boxDataRegist = GetStorage('dataRegist_rsbk');
  static Future<void> setToken(Token token) async {
    Token tokens = getToken;
    await boxToken.erase();
    await boxToken.write('code', token.code ?? tokens.code);
    await boxToken.write('token', token.token ?? tokens.token);
    Publics.controller.getToken.value = LocalStorages.getToken;
    return;
  }

  static Future<void> setDataRegist(DataRegist dataRegist) async {
    final getdata = getDataRegist;
    await boxDataRegist.write(
      'alamat',
      dataRegist.alamat ?? getdata.alamat,
    );
    await boxDataRegist.write(
      'alergi',
      dataRegist.alergi ?? getdata.alergi,
    );
    await boxDataRegist.write(
      'email',
      dataRegist.email ?? getdata.email,
    );
    await boxDataRegist.write(
      'golongan_darah',
      dataRegist.golonganDarah ?? getdata.golonganDarah,
    );
    await boxDataRegist.write(
      'jenis_kelamin',
      dataRegist.jenisKelamin ?? getdata.jenisKelamin,
    );
    await boxDataRegist.write(
      'nama_pasien',
      dataRegist.namaPasien ?? getdata.namaPasien,
    );
    await boxDataRegist.write(
      'no_hp',
      dataRegist.noHp ?? getdata.noHp,
    );
    await boxDataRegist.write(
      'no_ktp',
      dataRegist.noKtp ?? getdata.noKtp,
    );
    await boxDataRegist.write(
      'password',
      dataRegist.password ?? getdata.password,
    );
    await boxDataRegist.write(
      'tanggal_lahir',
      dataRegist.tanggalLahir ?? getdata.tanggalLahir,
    );
    await boxDataRegist.write(
      'tmp_lhr',
      dataRegist.tempatLahir ?? getdata.tempatLahir,
    );
    await boxDataRegist.write(
      'foto_pasien',
      dataRegist.fotoPasien ?? getdata.fotoPasien,
    );
    await boxDataRegist.write(
      'ingatSaya',
      dataRegist.ingatSaya ?? getdata.ingatSaya,
    );
    await boxDataRegist.write(
      'umur',
      dataRegist.umur ?? getdata.umur,
    );
    Publics.controller.getDataRegist.value = LocalStorages.getDataRegist;
    return;
  }

  static Token get getToken => Token.fromJson(boxToken.listenable.value);

  static DataRegist get getDataRegist =>
      DataRegist.fromJson(boxDataRegist.listenable.value);
}
