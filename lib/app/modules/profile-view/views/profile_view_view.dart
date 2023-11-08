import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileViewView extends StatelessWidget {
  final String tag;
  final String src;
  const ProfileViewView({Key? key, required this.src, required this.tag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Get.back(),
      startingOpacity: 0.5,
      direction: DismissiblePageDismissDirection.multi,
      child: Hero(
        tag: tag,
        child: Image.network(
          src,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
