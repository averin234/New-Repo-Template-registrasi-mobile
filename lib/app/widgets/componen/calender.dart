import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../color/custom_color.dart';

class MyCalender extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const MyCalender(this.title, {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? CustomColors.warnaputih
                    : CustomColors.darkmode1,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            readOnly: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xffeaeaea),
                  ),
                  borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                suffixIcon: Icon(Icons.calendar_month_rounded),
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? CustomColors.warnaputih
                    : CustomColors.darkmode1,
                filled: true),
            controller: controller,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: Get.context!,
                initialDate: controller.text.isEmpty
                    ? DateTime.now()
                    : DateTime.parse(controller.text),
                firstDate: DateTime(1800),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                controller.text = formattedDate;
              }
            },
          ),
        ),
      ]),
    );
  }
}
