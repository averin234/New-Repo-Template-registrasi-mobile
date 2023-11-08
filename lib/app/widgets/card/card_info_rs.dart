import 'package:flutter/material.dart';

import '../../data/model/homepage/detail_klinik.dart';
import '../assets/logo.dart';
import '../color/custom_color.dart';

class WidgetInfo extends StatefulWidget {
  final DetailKlinik detailklinik;
  const WidgetInfo({Key? key, required this.detailklinik}) : super(key: key);

  @override
  _WidgetInfoState createState() => _WidgetInfoState();
}

class _WidgetInfoState extends State<WidgetInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Theme.of(context).brightness == Brightness.light
            ? CustomColors.background
            : CustomColors.darkmode1,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 4,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                Assets.assetsLogoRs,
                width: 80,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.detailklinik.res!.first.namaPerusahaan ?? '',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.detailklinik.res![0].alamat ?? '',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: 5,
              ),
              // Icon(Icons.arrow_forward_ios_outlined, size: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
