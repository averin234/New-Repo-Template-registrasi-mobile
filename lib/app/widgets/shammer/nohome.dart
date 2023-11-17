import 'package:flutter/cupertino.dart';
import 'package:sirs_averin/app/widgets/shammer/shimmer_antri.dart';
import 'package:sirs_averin/app/widgets/shammer/shimmer_menu.dart';
import 'package:sirs_averin/app/widgets/shammer/shimmer_nama_rs.dart';
import 'package:sirs_averin/app/widgets/shammer/shimmer_slider.dart';

import '../font_size/my_style.dart';

class nohome extends StatelessWidget {
  const nohome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const shimmernohome(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                "Antrean anda saat ini",
                style: MyStyle.textTitleBlack,
              ),
            ),
            const shimmerAntri(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                "Fitur",
                style: MyStyle.textTitleBlack,
              ),
            ),
            const ShimmerMenu(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                "Jadwal Dokter",
                style: MyStyle.textTitleBlack,
              ),
            ),
            const shimmerJadwal(),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
