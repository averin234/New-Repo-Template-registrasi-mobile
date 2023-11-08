import 'package:flutter/material.dart';

import '../font_size/my_style.dart';

class WidgetTitleResep extends StatefulWidget {
  const WidgetTitleResep({Key? key}) : super(key: key);

  @override
  _WidgetTitleResepState createState() => _WidgetTitleResepState();
}

class _WidgetTitleResepState extends State<WidgetTitleResep> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 10, 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Text("Resep", style: MyStyle.textTitleBlack),
            ),
            const SizedBox(
              width: 10,
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: CustomColors.warnabiru, borderRadius: BorderRadius.circular(30)),
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Text(
            //       "Cetak Resep",
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.nunito(
            //         color: CustomColors.warnaputih,
            //         fontSize: MyFontSize.medium1,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}
