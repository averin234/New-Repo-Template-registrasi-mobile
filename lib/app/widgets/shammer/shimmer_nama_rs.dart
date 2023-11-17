import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmernohome extends StatelessWidget {
  const shimmernohome({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 355),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(500)),
                  padding: const EdgeInsets.all(10),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Shimmer(
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xFFBACDDB)),
                      constraints: const BoxConstraints(minWidth: 150, maxWidth: 200),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Shimmer(
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xFFBACDDB)),
                      constraints: const BoxConstraints(minWidth: 150, maxWidth: 200),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
