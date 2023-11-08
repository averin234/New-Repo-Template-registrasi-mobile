import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerAntri extends StatelessWidget {
  const shimmerAntri({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(children: [
        Shimmer(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFFBACDDB),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(minWidth: 170, maxWidth: 355),
            padding: EdgeInsets.all(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Shimmer(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFFBACDDB),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(minWidth: 170, maxWidth: 355),
            padding: EdgeInsets.all(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
