import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerListViewPoli extends StatelessWidget {
  const shimmerListViewPoli({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 150, maxWidth: 355),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x6cc7d1db)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
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
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x6cc7d1db)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
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
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x6cc7d1db)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
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
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x6cc7d1db)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
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
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x6cc7d1db)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
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
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              const BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: const EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
