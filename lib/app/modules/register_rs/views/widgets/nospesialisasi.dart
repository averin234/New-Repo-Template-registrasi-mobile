import 'package:flutter/material.dart';

import '../../../../widgets/color/custom_color.dart';

class CardNoSpesialisasi extends StatelessWidget {
  const CardNoSpesialisasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: CustomColors.warnaputih,
                  offset: Offset(2, 1),
                  blurRadius: 1,
                  spreadRadius: 2,
                ),
              ],
              color: CustomColors.warnaputih,
            ),
            child: Image.asset('assets/images/nospesialisasi.png'),
          ),
        ),
        SizedBox(height: 300)
      ],
    );
  }
}
