import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rskgcare/app/widgets/endpoint/fetch_data.dart';
import 'package:rskgcare/app/data/componen/publics.dart';
import 'package:rskgcare/app/data/model/profile_pasien/data_px.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/color/custom_color.dart';
import 'app/widgets/text/string_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init('token_rsbk');
  await GetStorage.init('dataRegist_rsbk');
  DataPx cekData = await API.cekDataPx(
      noKtp: Publics.controller.getDataRegist.value.noKtp ?? '');
  runApp(MyApp(code: cekData.code ?? 500));
}

class MyApp extends StatelessWidget {
  final int? code;
  const MyApp({super.key, this.code});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '${CustomStringText().namaRS}',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: CustomColors.warnaputih,
          foregroundColor: CustomColors.warnahitam,
          iconTheme: IconThemeData(color: CustomColors.warnahitam),
        ),
      ),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      // ...
      initialRoute: code == 500 ? Routes.NO_HOME : Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: CustomColors.warnaputih,
        foregroundColor: CustomColors.warnahitam,
        iconTheme: IconThemeData(color: CustomColors.warnahitam),
      ));
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: CustomColors.warnahitam,
        primary: Colors.grey[900]!,
        secondary: Colors.grey[900]!,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: CustomColors.warnahitam,
        foregroundColor: CustomColors.warnaputih,
        iconTheme: IconThemeData(color: CustomColors.warnahitam),
      ));
}
