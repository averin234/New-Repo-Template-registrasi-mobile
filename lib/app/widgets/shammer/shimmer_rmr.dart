import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmerRMR extends StatelessWidget {
  const shimmerRMR({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 355),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0x6cc7d1db)),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer(
                child: Container(
                  margin: EdgeInsets.only(left: 0),
                  height: 20,
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
                  margin: EdgeInsets.only(left: 0),
                  height: 20,
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
                  margin: EdgeInsets.only(left: 0),
                  height: 5,
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
                  margin: EdgeInsets.only(left: 0),
                  height: 5,
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
                  margin: EdgeInsets.only(left: 0),
                  height: 5,
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
            ],
          ),
        ),
      ]),
    );
  }
}
