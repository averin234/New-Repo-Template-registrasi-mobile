import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerListViewPoli extends StatelessWidget {
  const shimmerListViewPoli({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 150, maxWidth: 355),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x6cc7d1db)),
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
                          color: Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(500)),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x6cc7d1db)),
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
                          color: Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(500)),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x6cc7d1db)),
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
                          color: Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(500)),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x6cc7d1db)),
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
                          color: Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(500)),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x6cc7d1db)),
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
                          color: Color(0xFFBACDDB),
                          borderRadius: BorderRadius.circular(500)),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFBACDDB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints:
                              BoxConstraints(minWidth: 150, maxWidth: 230),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
