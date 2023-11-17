import 'package:get/get.dart';

import '../modules/daftar_antrian/bindings/daftar_antrian_binding.dart';
import '../modules/daftar_antrian/views/daftar_antrian_view.dart';
import '../modules/detail-antrian/bindings/detail_antrian_binding.dart';
import '../modules/detail-antrian/views/detail_antrian_view.dart';
import '../modules/detail-poli/bindings/detail_poli_binding.dart';
import '../modules/detail-poli/views/detail_poli_view.dart';
import '../modules/detail-riwayat/bindings/detail_riwayat_binding.dart';
import '../modules/detail-riwayat/views/detail_riwayat_view.dart';
import '../modules/edit-profile/bindings/edit_profile_binding.dart';
import '../modules/edit-profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/no_home/bindings/no_home_binding.dart';
import '../modules/no_home/views/no_home_view.dart';
import '../modules/profile_pasien/bindings/rubah_password_binding.dart';
import '../modules/profile_pasien/views/profile.dart';
import '../modules/register_akun/bindings/register_binding.dart';
import '../modules/register_akun/views/register_view.dart';
import '../modules/register_rs/bindings/register_rs_binding.dart';
import '../modules/register_rs/views/register_rs_view.dart';
import '../modules/register_telemedic/bindings/register_telemedic_binding.dart';
import '../modules/register_telemedic/views/register_telemedic_view.dart';
import '../modules/riwayat_medis/bindings/riwayat_medis_binding.dart';
import '../modules/riwayat_medis/views/riwayat_medis_view.dart';
import '../modules/scanner_antrian/bindings/scanner_antrian_binding.dart';
import '../modules/scanner_antrian/views/scanner_antrian_view.dart';
import '../modules/setting-profile/bindings/setting_profile_binding.dart';
import '../modules/setting-profile/views/setting_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_RS,
      page: () => const RegisterRsView(),
      binding: RegisterRsBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_TELEMEDIC,
      page: () => const RegisterTelemedicView(),
      binding: RegisterTelemedicBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_ANTRIAN,
      page: () => const DaftarAntrianView(),
      binding: DaftarAntrianBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT_MEDIS,
      page: () => const RiwayatMedisView(),
      binding: RiwayatMedisBinding(),
    ),

    GetPage(
      name: _Paths.DETAIL_RIWAYAT,
      page: () => const DetailRiwayatView(),
      binding: DetailRiwayatBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ANTRIAN,
      page: () => const DetailAntrianView(),
      binding: DetailAntrianBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POLI,
      page: () => const DetailPoliView(),
      binding: DetailPoliBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_PROFILE,
      page: () => const SettingProfileView(),
      binding: SettingProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.RUBAH_PASSWORD,
      page: () => const RubahPasswordView(),
      binding: RubahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER_ANTRIAN,
      page: () => const ScannerAntrianView(),
      binding: ScannerAntrianBinding(),
    ),
    GetPage(
      name: _Paths.NO_HOME,
      page: () => const NoHomeView(),
      binding: NoHomeBinding(),
    ),
  ];
}
