import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rskgcare/app/widgets/card/card_edit.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../widgets/card/card_penting.dart';
import '../../../widgets/color/custom_color.dart';
import '../../../widgets/font_size/my_font_size.dart';
import '../../../widgets/text/string_text.dart';
import '../../profile_pasien/views/profile.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  RubahPasswordView()), // Ganti dengan halaman home Anda
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? CustomColors.background
            : CustomColors.darkmode1,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? CustomColors.warnaputih
                  : CustomColors.darkmode1,
              floating: true,
              pinned: true,
              snap: true,
              stretch: true,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_circle_left_rounded),
                  color: CustomColors.warnabiru,
                  iconSize: 40,
                  onPressed: () {
                    Get.back();
                  }),
              title: Text(
                "${CustomStringText().EditProfile}",
                style: GoogleFonts.nunito(
                    fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
              ),
              bottom: AppBar(
                toolbarHeight: 0,
              ),
            ),
            // Other Sliver Widgets
            SliverList(
              delegate: SliverChildListDelegate([
                Penting(),
                const MyRegister1(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
