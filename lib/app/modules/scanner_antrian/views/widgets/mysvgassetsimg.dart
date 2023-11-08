import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class MySvgAssetsImg extends StatelessWidget {
  String imageName;
  double? imgHeight, imgWidth;
  dynamic fit, iconColor;

  MySvgAssetsImg(
      {Key? key,
        required this.imageName,
        required this.fit,
        this.iconColor,
        this.imgHeight,
        this.imgWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        "assets/images/" + imageName,
        height: imgHeight,
        width: imgWidth,
        allowDrawingOutsideViewBox: false,
        fit: fit,
        color: iconColor,
      ),
    );
  }
}