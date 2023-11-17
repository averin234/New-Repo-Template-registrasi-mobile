import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerRMR extends StatelessWidget {
  const shimmerRMR({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer(
                child: Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 20,
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
                  margin: const EdgeInsets.only(left: 0),
                  height: 20,
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
                  margin: const EdgeInsets.only(left: 0),
                  height: 5,
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
                  margin: const EdgeInsets.only(left: 0),
                  height: 5,
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
                  margin: const EdgeInsets.only(left: 0),
                  height: 5,
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
            ],
          ),
        ),
      ]),
    );
  }
}
