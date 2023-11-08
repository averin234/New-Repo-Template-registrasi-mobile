import 'package:flutter/material.dart';

import '../color/custom_color.dart';

class WidgetTitlePoli extends StatefulWidget {
  const WidgetTitlePoli({Key? key}) : super(key: key);

  @override
  _WidgetTitlePoliState createState() => _WidgetTitlePoliState();
}

class _WidgetTitlePoliState extends State<WidgetTitlePoli> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.warnabiru,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Row(
          children: [
            Expanded(
              child: Text("Buat Janji dengan dokter sesuai kebutuhanmu.",
                  style: TextStyle(
                      color: CustomColors.warnaputih,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/registrasi_polik.png',
              width: 120.0,
              height: 90.0,
              fit: BoxFit.cover,
            ),
            // Text(
            //   "Details",
            //   textAlign: TextAlign.center,
            //   style: GoogleFonts.nunito(
            //     color: MyCustomColors.warnahitamText,
            //     fontSize: MyFontSize.medium1,
            //   ),
            // ),
            // Icon(Icons.arrow_forward_ios_outlined, size: 15,)
          ],
        ),
      ),
    );
  }
}
