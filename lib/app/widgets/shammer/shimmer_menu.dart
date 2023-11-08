import 'package:flutter/cupertino.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerMenu extends StatelessWidget {
  const ShimmerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 355),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Shimmer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Shimmer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                Shimmer(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
