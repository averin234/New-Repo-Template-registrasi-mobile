import 'package:flutter/material.dart';

import '../color/custom_color.dart';

class WidgetTitleRiwayat2 extends StatefulWidget {
  const WidgetTitleRiwayat2({Key? key}) : super(key: key);

  @override
  _WidgetTitleRiwayat2State createState() => _WidgetTitleRiwayat2State();
}

class _WidgetTitleRiwayat2State extends State<WidgetTitleRiwayat2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff4babe7),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Informasi",
                  style: TextStyle(
                      color: CustomColors.warnaputih,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        "Catatan kesehatan dan informasi mengenai identifikasi pasien.",
                        style: TextStyle(color: CustomColors.warnaputih)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/rewayat_mr.png',
                    width: 120.0,
                    height: 90.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Icon(Icons.arrow_forward_ios_outlined, size: 15,)
                ],
              ),
            ],
          ),
        ));
  }
}
