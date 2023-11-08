import 'package:flutter/material.dart';

class WidgetNoAntri extends StatefulWidget {
  const WidgetNoAntri({Key? key}) : super(key: key);

  @override
  _WidgetNoAntriState createState() => _WidgetNoAntriState();
}

class _WidgetNoAntriState extends State<WidgetNoAntri> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Image.asset(
        'assets/images/noantri.png',
        height: 150,
      ),
    );
  }
}
