import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerAntri extends StatelessWidget {
  const shimmerAntri({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(children: [
        Shimmer(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFBACDDB),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(minWidth: 170, maxWidth: 355),
            padding: const EdgeInsets.all(10),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Shimmer(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFBACDDB),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(minWidth: 170, maxWidth: 355),
            padding: const EdgeInsets.all(10),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
