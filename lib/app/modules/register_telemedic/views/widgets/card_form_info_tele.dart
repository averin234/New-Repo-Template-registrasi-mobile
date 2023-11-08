import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/color/custom_color.dart';

class CardFromInfoTele extends StatelessWidget {
  const CardFromInfoTele({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.warnaputih,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _Info(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _Info() {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Informasi",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Hemodialisis adalah perawatan untuk menyaring limbah dan air dari darah. Hemodialisis membantu mengontrol tekanan darah dan menteimbangkan mineral penting, seperti kalium, natrium, dan kalsium, dalam darah, Hemodialisis dapata membantu mengembalikan kualitas hidup, tetapi terapi ini bukan obat untuk menyembuhkan gagal ginjal',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              ),
            ),
          ],
        ));
  }
}
