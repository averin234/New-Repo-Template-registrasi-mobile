import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class shimmernohome extends StatelessWidget {
  const shimmernohome({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 150, maxWidth: 355),
      child: Column(
        children: [
          SizedBox(
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
                      color: Color(0xFFBACDDB),
                      borderRadius: BorderRadius.circular(500)),
                  padding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Shimmer(
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xFFBACDDB)),
                      constraints: BoxConstraints(minWidth: 150, maxWidth: 200),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Shimmer(
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xFFBACDDB)),
                      constraints: BoxConstraints(minWidth: 150, maxWidth: 200),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
