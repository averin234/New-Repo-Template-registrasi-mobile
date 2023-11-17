import 'package:flutter/material.dart';
import '../font_size/my_style.dart';

class WidgetTitleRiwayat3 extends StatefulWidget {
  const WidgetTitleRiwayat3({Key? key}) : super(key: key);

  @override
  _WidgetTitleRiwayat3State createState() => _WidgetTitleRiwayat3State();
}

class _WidgetTitleRiwayat3State extends State<WidgetTitleRiwayat3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: [
          Expanded(
            child: Text("Medical Record", style: MyStyle.textTitleBlack),
          ),
          const SizedBox(
            width: 10,
          ),
          // Text(
          //   "Details",
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.nunito(
          //     color: MyCustomColors.warnahitamText,
          //     fontSize: MyFontSize.medium1,
          //   ),
          // ),
          const SizedBox(
            width: 10,
          ),
          // Icon(Icons.arrow_forward_ios_outlined, size: 15,)
        ],
      ),
    );
  }
}
